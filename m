From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 25 Jan 2019 07:54:41 +0000
Subject: Re: [PATCH -next] MIPS: fix debugfs_simple_attr.cocci warnings
Message-Id: <20190125075441.GA14522@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548384137-171488-1-git-send-email-yuehaibing@huawei.com>
 <20190125071159.GA11891@kroah.com>
 <efbbf61d-0c4a-e7f6-8ce1-b5e6417afff1@huawei.com>
In-Reply-To: <efbbf61d-0c4a-e7f6-8ce1-b5e6417afff1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 25, 2019 at 03:43:21PM +0800, YueHaibing wrote:
> On 2019/1/25 15:11, Greg Kroah-Hartman wrote:
> > On Fri, Jan 25, 2019 at 02:42:17AM +0000, YueHaibing wrote:
> >> Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE
> >> for debugfs files.
> >>
> >> Semantic patch information:
> >> Rationale: DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
> >> imposes some significant overhead as compared to
> >> DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().
> > 
> > What kind of overhead is this adding, and how are you measuring it?
> 
> The log message on the commit introducing the semantic patch says the
> following:
> 
> commit 5103068eaca2 ("debugfs, coccinelle: check for obsolete DEFINE_SIMPLE_ATTRIBUTE() usage")
> 
>     In order to protect against file removal races, debugfs files created via
>     debugfs_create_file() now get wrapped by a struct file_operations at their
>     opening.
> 
>     If the original struct file_operations are known to be safe against removal
>     races by themselves already, the proxy creation may be bypassed by creating
>     the files through debugfs_create_file_unsafe().
> 
>     In order to help debugfs users who use the common
>       DEFINE_SIMPLE_ATTRIBUTE() + debugfs_create_file()
>     idiom to transition to removal safe struct file_operations, the helper
>     macro DEFINE_DEBUGFS_ATTRIBUTE() has been introduced.
> 
>     Thus, the preferred strategy is to use
>       DEFINE_DEBUGFS_ATTRIBUTE() + debugfs_create_file_unsafe()
>     now.


That is true.  So, are you saying that you "know" when you remove these
files everything is safe?  Are you seeing some sort of problem with
these files as-is?  If not, why change them to the "unsafe" method?

thanks,

greg k-h
