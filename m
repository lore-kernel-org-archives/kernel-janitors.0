From: Michael Veeck <michael.veeck@gmx.net>
Date: Tue, 01 Nov 2005 19:43:30 +0000
Subject: Re: [KJ] [RFC] new design for kerneljanitors.org REV 2
Message-Id: <4367C562.5080202@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61430729247415128=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42C1CDE1.9010308@gmx.net>
In-Reply-To: <42C1CDE1.9010308@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============61430729247415128==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Looks good too, though I had to make the #headmain even wider to 
compensate for the bigger font-size.

I added that style as classicstyle2 on the webpage, see for yourself now.

Best regards
Michael Veeck

Jerome Pinot schrieb:
> On 11/1/05, Michael Veeck <X@X.X> wrote:
> 
>>[...]
>>So if you have the time (and some skill) why not try to design your own
>>css-file and show us how the page can look a lot more different ;-) ?
>>
> 
> 
> Diff to standard CSS:
> 
> ---8<----
> --- style.css   2005-11-01 22:52:38.000000000 +0900
> +++ style.css.new       2005-11-01 23:19:54.000000000 +0900
> @@ -3,7 +3,7 @@
>          margin-left: auto;
>          margin-right: auto;
>          font-family: verdana, arial, helvetica, sans-serif;
> -        font-size: 12pt;
> +        font-size: 10pt;
>          color: #000000;
>          background-color: #b0b9ca;
>  }
> @@ -17,13 +17,14 @@
>  }
> 
>  #headmain {
> -        width: 600px;
> +        width: 620px;
>          border-collapse: collapse;
>          border-style: solid;
>          border-width: 1px;
>          border-color: #000000;
>          border-spacing: 1px;
>          padding:3px;
> +        font-size: 14pt;
>          margin-top: 10px;
>          margin-left: auto;
>          margin-right: auto;
> @@ -107,6 +108,7 @@
> 
>  div.title {
>          text-align: center;
> +        font-size: 12pt;
>          font-weight: bold;
>          color: #ffffff;
>          background-color: #000000;
> @@ -128,25 +130,21 @@
>  a:link {
>          color: #000099;
>          text-decoration: underline;
> -        font-weight: bold;
>  }
> 
>  a:visited {
>          color: #000099;
>          text-decoration: none;
> -        font-weight: bold;
>  }
> 
>  a:active {
>          color: #000099;
>          text-decoration: underline;
> -        font-weight: bold;
>  }
> 
>  a:hover {
>          color: #990000;
>          text-decoration: none;
> -        font-weight: bold;
>  }
> 
>  ul {
> ----8<----
> 
> 
> --
> Jerome Pinot
> http://ngc891.blogdns.net/

--===============61430729247415128==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61430729247415128==--
