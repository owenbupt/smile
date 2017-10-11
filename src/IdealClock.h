//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

#pragma once

#include "IClock.h"
#include "omnetpp.h"

namespace smile {

class IdealClock : public omnetpp::cSimpleModule, public IClock
{
 public:
  IdealClock() = default;
  IdealClock(const IdealClock& source) = delete;
  IdealClock(IdealClock&& source) = delete;
  ~IdealClock() override = default;

  IdealClock& operator=(const IdealClock& source) = delete;
  IdealClock& operator=(IdealClock&& source) = delete;

  omnetpp::SimTime getClockTimestamp() override;
  omnetpp::SimTime getSimulationTimestamp(const omnetpp::SimTime& delay) override;
};

}  // namespace smile