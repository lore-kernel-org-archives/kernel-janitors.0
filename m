From: Steve Longerbeam <stevel@mvista.com>
Date: Wed, 22 Sep 2004 15:36:07 +0000
Subject: Re: [Kernel-janitors] [PATCH] __FUNCTION__ string concatenation
Message-Id: <41519BE7.3060102@mvista.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38049263234625919=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040705120057.GA22161@moley.homelinux.net>
In-Reply-To: <20040705120057.GA22161@moley.homelinux.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============38049263234625919==
Content-Type: multipart/alternative;
	boundary="------------070401020505030908030307"

This is a multi-part message in MIME format...

--------------070401020505030908030307
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Clemens, thanks a bunch for doing this work!
I have access to these MIPS boards so I can test
these drivers soon.

Steve

Clemens Buchacher wrote:

>On Mon, Sep 20, 2004 at 06:59:28PM +0200, maximilian attems wrote:
>  
>
>>On Mon, 20 Sep 2004, Clemens Buchacher wrote:
>>    
>>
>>> arch/mips/au1000/common/usbdev.c |    4 ++--
>>> drivers/net/gt96100eth.c         |   10 +++++-----
>>> sound/oss/au1000.c               |    2 +-
>>> sound/oss/ite8172.c              |    2 +-
>>> 4 files changed, 9 insertions(+), 9 deletions(-)
>>>
>>>Status: untested
>>>
>>>      
>>>
>>would be cool to get those in 4 separeted mails and compile tested.
>>    
>>
>
>Unfortunately, the whole MIPS tree seems to be in no condition to compile. It
>would probably be a better idea to apply this patch to the linux-mips branch.
>
>I will do that as soon as I can free enough bandwidth to pull from
>linux-mips.bkbits.net.
>
>Clemens
>  
>

--------------070401020505030908030307
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
Hi Clemens, thanks a bunch for doing this work!<br>
I have access to these MIPS boards so I can test<br>
these drivers soon.<br>
<br>
Steve<br>
<br>
Clemens Buchacher wrote:
<blockquote cite="mid20040923131903.GA25729@kzelldran" type="cite">
  <pre wrap="">On Mon, Sep 20, 2004 at 06:59:28PM +0200, maximilian attems wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">On Mon, 20 Sep 2004, Clemens Buchacher wrote:
    </pre>
    <blockquote type="cite">
      <pre wrap=""> arch/mips/au1000/common/usbdev.c |    4 ++--
 drivers/net/gt96100eth.c         |   10 +++++-----
 sound/oss/au1000.c               |    2 +-
 sound/oss/ite8172.c              |    2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

Status: untested

      </pre>
    </blockquote>
    <pre wrap="">would be cool to get those in 4 separeted mails and compile tested.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Unfortunately, the whole MIPS tree seems to be in no condition to compile. It
would probably be a better idea to apply this patch to the linux-mips branch.

I will do that as soon as I can free enough bandwidth to pull from
linux-mips.bkbits.net.

Clemens
  </pre>
</blockquote>
</body>
</html>

--------------070401020505030908030307--

--===============38049263234625919==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38049263234625919==--
