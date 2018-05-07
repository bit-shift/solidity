/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.

	Usage:

	using namespace experimental;
	auto compute = [](bool const& _ok) -> Result<bool> {
		if (_ok)
			return true;
		return Err("error");
	};

	auto result = compute(true);
	match<bool>(
		result,
		[&](bool const& _type) { ... },
		[&](Err const& _err) { ... }
	);
*/

#pragma once

#include <boost/variant/variant.hpp>

namespace dev
{
namespace experimental {

class Err {
public:
	Err(std::string const& _message = ""): m_message(_message) {}
	std::string message() const { return m_message; }
private:
	std::string m_message;
};

template<typename T>
using Result = boost::variant<T, Err>;

template<typename T>
using OnSuccess = std::function<void(T)>;
using OnError = std::function<void(Err)>;

template<class T>
class ResultVisitor : public boost::static_visitor<>
{
public:
	ResultVisitor(OnSuccess<T> const& _onSucess, OnError const& _onError):
		m_onSuccess(_onSucess),
		m_onError(_onError)
	{
	}

	void operator()(T const& _ok) const { m_onSuccess(_ok); }
	void operator()(Err const& _err) const { m_onError(_err); }

private:
	OnSuccess<T> m_onSuccess;
	OnError m_onError;
};


template<class T>
void match(
	Result<T> const& _result,
	OnSuccess<T> const& _ok,
	OnError const& _err
)
{
	boost::apply_visitor(ResultVisitor<T>(_ok, _err), _result);
}

}
}
