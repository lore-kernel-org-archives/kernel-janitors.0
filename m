From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Thu, 05 Aug 2010 21:48:55 +0000
Subject: Re: [PATCH 11/42] drivers/ieee1394: Adjust confusing if indentation
Message-Id: <4C5B31C7.4000109@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052219530.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052219530.31692@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> Indent the branch of an if.

Committed to linux1394-2.6.git.

> The semantic match that finds this problem is as follows:

It did not find this line though:
http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dblob=
;f=3DDocumentation/feature-removal-schedule.txt;h=BE7030e4dd73697ed5b979f02=
b6841dac7bb69c0#l549
--=20
Stefan Richter
-=3D=3D=3D-=3D-=3D- =3D--- --=3D-http://arcgraph.de/sr/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
