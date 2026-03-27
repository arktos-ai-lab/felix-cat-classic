#pragma once
// Minimal luawrapper::LuaState stub vendored from the original
// kmsquire/luawrapper project (now archived/deleted).
// Provides the subset used by Felix and the Office add-ins:
//   construction/destruction, is_valid(), get_string().

#include <lua.hpp>

namespace luawrapper {

class LuaState {
public:
    LuaState() : m_state(nullptr) {
        m_state = luaL_newstate();
        if (m_state) {
            luaL_openlibs(m_state);
        }
    }
    ~LuaState() {
        if (m_state) {
            lua_close(m_state);
            m_state = nullptr;
        }
    }
    // Non-copyable
    LuaState(const LuaState&) = delete;
    LuaState& operator=(const LuaState&) = delete;

    bool is_valid() const { return m_state != nullptr; }

    const char* get_string(int index) const {
        const char* s = lua_tostring(m_state, index);
        return s ? s : "";
    }

    lua_State* get() const { return m_state; }

private:
    lua_State* m_state;
};

} // namespace luawrapper
