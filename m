From: walter harms <wharms@bfs.de>
Date: Wed, 29 Jun 2005 11:01:35 +0000
Subject: Re: [KJ] [PATCH 2.6.12] [RESEND] /proc/tty/driver/* filtering for
Message-Id: <42C27F8F.3040103@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52167058855160098=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050622194756.GA6699@dansme-mobile.smertnig>
In-Reply-To: <20050622194756.GA6699@dansme-mobile.smertnig>
To: kernel-janitors@vger.kernel.org

--===============52167058855160098==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


i am not an expert in using /proc but why should '\n' so important that 
only CAP_SYS_RAWIO may use it ?
buf will already have the baud information in the string.
perhaps checking first for CAP_SYS_RAWIO would make sense ?

re,
	walter



Domen Puncer wrote:
> On 22/06/05 21:47 +0200, Daniel Smertnig wrote:
> 
>>Only give out non-sensitive information to CAP_SYS_RAWIO users in
>>/proc/tty/driver/* and make it world-readable, as described in the
>>kernel janitors TODO:
>>
>>Signed-off-by: Daniel Smertnig <daniel.smertnig@gmail.com>
>>
>>diff --git a/drivers/char/amiserial.c b/drivers/char/amiserial.c
>>--- a/drivers/char/amiserial.c
>>+++ b/drivers/char/amiserial.c
>>@@ -1876,6 +1876,17 @@ static inline int line_info(char *buf, s
>> 		info->quot = 0;
>> 		info->tty = NULL;
>> 	}
>>+
>>+	if (info->quot) {
>>+		ret += sprintf(buf+ret, " baud:%d",
>>+			       state->baud_base / info->quot);
>>+	}
>>+
>>+	if (!capable(CAP_SYS_RAWIO)) {
>>+		strcat(buf, "\n");
>>+		return ret + 1;
> 
> 
> So... we overwrite first two bytes, and then return the whole string?
> Or am I missing something?
> 
> 
>>+	}
>>+	
> 
> 
>    ^^ you introduce whitespace.
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52167058855160098==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52167058855160098==--
