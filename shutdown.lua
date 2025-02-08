if GetMethod() == "POST" then
  print("shutdown called")
  unix.kill(unix.getppid(), 15)
  Write("<div>shutting down server</div>")
  Write("<div>bye</div>")
else
  Write("<div>shutdown?</div>")
  Write("<form action=/shutdown.lua method=post>")
  Write("<button>yes</button>")
  Write("</form>")
end
