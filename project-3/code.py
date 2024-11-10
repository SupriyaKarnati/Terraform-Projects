from flask import Flask # type: ignore

app = Flask(__name__)

@app.route("/")
def hello_terraform():
    return "Hello, Terraform!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)

    #ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZGvCv17t5IME5LBvAsquQ4rgRgH7Kk9+F3vtIfseF7Jf2achVaFIL2kh5vtti3ktlSlj5SJ0Jtg85wHqVip4qRIGwUncW6GAn4HPwhZgsa/3cUUjIoqg8x+34TVPi/aF03HvgANuCIp2zSIWUyhsFUQ4Gzse3BgRhSO8ESExQ3SyChBRC3QYi64XuTd8I+qJVkXJwpQXJA1IU1behmH4MxyqLmwgtdLEZt9XJ8d/IffmpaqshyRNfjwLu8Pedz05V4LWNmzdvxF7QglvjpDJKUJ7yzVg0uSIvoOAxfyQ/RlSzBQIwNL2KmG+OexzI9T7144f1zc2ZosguExl2y/aJ/IWm79Kac+euGFYcw/RFOOFFn9OX96MWjm8PBO7lGvNQna92+AhPaNOtXC5Q9UyQGSvs9E0lt7GiSI500LBIcqLEjuAW5/aKi/9xEgymGTkK9UxkuklmQSxkDN456dPXMiMhNczKXPPCjF/Srt0ZlP2ZGO+lnj/d7m+PW3fxZek= manu@manu-HP-Pavilion-Laptop-14-ce3xxx
#home/manu/Desktop/supriya_devops_prac/terraform/project-3/keypair.pub