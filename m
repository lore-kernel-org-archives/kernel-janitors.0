From: Ben Collins <bcollins@debian.org>
Date: Thu, 22 Jul 2004 23:26:53 +0000
Subject: Re: [Kernel-janitors] [PATCH] ieee/sbp2: replace schedule_timeout()
Message-Id: <20040722232653.GC26547@phunnypharm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20274188031568463=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040722223527.GV2165@us.ibm.com>
In-Reply-To: <20040722223527.GV2165@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============20274188031568463==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2004 at 10:35:28PM +0000, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. This is one (of
> many) cases where I made a decision about replacing
> 
> set_current_state(TASK_INTERRUPTIBLE);
> schedule_timeout(some_time);
> 
> with
> 
> msleep(jiffies_to_msecs(some_time));
> 
> msleep() is not exactly the same as the previous code, but I only did
> this replacement where I thought long delays were *desired*. If this is
> not the case here, then just disregard this patch.

Doesn't msleep() block? If so, that's not what we want at all. We want
other things to happen during that time (like maybe catch a bus reset).

-- 
Debian     - http://www.debian.org/
Linux 1394 - http://www.linux1394.org/
Subversion - http://subversion.tigris.org/
WatchGuard - http://www.watchguard.com/

--===============20274188031568463==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20274188031568463==--
