defmodule TryCatchRescue.ExceptionSample do
  defexception [message: "Fck", error: "dont known"]
end

# TryCatchRescue.ExceptionSample.exception("wwhatever DUDE") to custom error os just raise TryCatchRescue.ExceptionSample "whatever"
