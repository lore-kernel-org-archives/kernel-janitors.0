From: Joe Perches <joe@perches.com>
Date: Fri, 12 May 2017 07:52:20 +0000
Subject: Re: vmbus: Delete an error message for a failed memory allocation in vmbus_device_create()
Message-Id: <1494575540.2028.17.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
         <587dbcf5-8b12-fac7-693e-5f471e6d5167@users.sourceforge.net>
         <20170511093015.4cdfdb6c@xeon-e3> <20170512070909.xxa62d2cde3qoj4f@mwanda>
         <8d38547f-a086-438a-5b2a-4d11929530ec@users.sourceforge.net>
In-Reply-To: <8d38547f-a086-438a-5b2a-4d11929530ec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, Wolfram Sang <wsa@the-dreams.de>, Haiyang Zhang <haiyangz@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@linuxdriverproject.org

On Fri, 2017-05-12 at 09:32 +0200, SF Markus Elfring wrote:
> Will patches be picked up also from contributors who got a special
> development reputation anyhow?

Yes.

Developer reputation matters for somewhat controversial
patches being applied as well as non-controversial and
obviously correct patches being ignored.

Your reputation means most all of your patches fall into
the latter category.

Look up "wheat and chaff".

Your patches are mostly chaff.

You have produced many trivial patches that have caused
new defects.  That is simply unacceptable.  Especially
when you don't immediately fix the problems you cause.

If you would stop producing the trivial and instead
channel your efforts into actual=A0bug fixing and logic
corrections and not just style modifications with no
code impact, your patch acceptance rate would increase.

Yes, your daily patch production rate would fall.
Likely every reader of LKML but you would be happy.

I have given you many suggestions for actual structural
improvements to kernel code.

You have ignored _all_ of them and I am unlikely to try
to interact with you any longer until your wheat:chaff
ratio changes.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
