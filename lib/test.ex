defmodule Test do
    require Logger

    def log_dump_test do
        Logger.debug "DEBUG MSG"
        Logger.info "INFO MSG"
        Logger.warn "WARN MSG"
        Logger.error "ERR MGS"
    end

end
