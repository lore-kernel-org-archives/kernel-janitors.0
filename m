From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Mon, 12 Jan 2004 23:54:23 +0000
Subject: Re: [Kernel-janitors] TODO suggestions.
Message-Id: <20040112155423.58efda42.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1073548328.2024.27.camel@telecentrolivre>
In-Reply-To: <1073548328.2024.27.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 13 Jan 2004 07:45:35 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:

| List:
| http://kbugs.org/cgi-bin/index.py?page=bug_list&script=SpinSleepLazy&skernel=2.6.0-test11&sfile| 
| Specific example:
| http://kbugs.org/cgi-bin/index.py?page=source&version=2.6.0-test11&file=drivers/scsi/ide-scsi.c&&script=SpinSleepLazy&skernel=2.6.0-test11&sfile=&start_bug=0&#line892
| 
| <quote sender="Eugene Teo">
| > <quote sender="Randy.Dunlap">
| > > On Mon, 12 Jan 2004 12:42:49 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:
| > > 
| > > | There are a handful of schedule() within spinlocks. That needs to
| > > | be looked at.
| > > 
| > > Are these listed somewhere, like by smatch/kbugs.org ?
| > 
| > yes

Thanks, I added that URL.

--
~Randy
MOTD:  Always include version info.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
