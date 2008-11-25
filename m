From: Harvey Harrison <harvey.harrison@gmail.com>
Date: Tue, 25 Nov 2008 00:56:58 +0000
Subject: Re: [PATCH] CRED: fix sparse warnings
Message-Id: <1227574619.5511.33.camel@brick>
List-Id: <kernel-janitors.vger.kernel.org>
References: <154e089b0811241314t3291ea30w6268bb5b2b5c7c53@mail.gmail.com>
	 <5008.1227568869@redhat.com>
	 <154e089b0811241646y6ada2c97l5e45284969729e29@mail.gmail.com>
In-Reply-To: <154e089b0811241646y6ada2c97l5e45284969729e29@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2008-11-25 at 01:46 +0100, Hannes Eder wrote:
> On Tue, Nov 25, 2008 at 12:21 AM, David Howells <dhowells@redhat.com> wrote:
> > Hannes Eder <hannes@hanneseder.net> wrote:
> >
> >>   security/security.c:228:2: warning: returning void-valued expression
> >>   security/security.c:233:2: warning: returning void-valued expression
> >>   security/security.c:616:2: warning: returning void-valued expression
> >
> > What's wrong with that?

Well, there's still a few left, I kind of stopped going after this
class of sparse warnings.

But if you're up to it:
mm/hugetlb.c:375:3: warning: returning void-valued expression
mm/hugetlb.c:408:3: warning: returning void-valued expression
fs/xfs/xfs_inode.h:326:2: warning: returning void-valued expression
security/security.c:228:2: warning: returning void-valued expression
security/security.c:233:2: warning: returning void-valued expression
security/security.c:616:2: warning: returning void-valued expression
drivers/ide/alim15x3.c:594:2: warning: returning void-valued expression
drivers/isdn/i4l/isdn_net.c:1981:3: warning: returning void-valued expression
drivers/rtc/rtc-ds1511.c:634:2: warning: returning void-valued expression
drivers/rtc/rtc-stk17ta8.c:403:2: warning: returning void-valued expression
drivers/video/nvidia/nv_accel.c:304:3: warning: returning void-valued expression
drivers/video/nvidia/nv_accel.c:323:3: warning: returning void-valued expression
drivers/video/via/viafbdev.c:871:3: warning: returning void-valued expression
drivers/video/via/viafbdev.c:938:3: warning: returning void-valued expression
drivers/video/via/viafbdev.c:995:3: warning: returning void-valued expression
drivers/video/pm3fb.c:543:3: warning: returning void-valued expression
drivers/video/neofb.c:1456:4: warning: returning void-valued expression
drivers/video/neofb.c:1464:3: warning: returning void-valued expression
drivers/video/i810/i810_accel.c:305:3: warning: returning void-valued expression
drivers/video/i810/i810_accel.c:331:3: warning: returning void-valued expression
drivers/video/i810/i810_accel.c:370:3: warning: returning void-valued expression
drivers/video/intelfb/intelfbdrv.c:1497:3: warning: returning void-valued expression
drivers/video/intelfb/intelfbdrv.c:1525:3: warning: returning void-valued expression
drivers/video/intelfb/intelfbdrv.c:1544:3: warning: returning void-valued expression
drivers/video/intelfb/intelfbdrv.c:1558:3: warning: returning void-valued expression
sound/sound_core.c:460:2: warning: returning void-valued expression
sound/sound_core.c:477:2: warning: returning void-valued expression

Cheers,

Harvey

