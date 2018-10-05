From: Borislav Petkov <bp@alien8.de>
Date: Fri, 05 Oct 2018 20:38:31 +0000
Subject: Re: [PATCH -next] EDAC: Fix debugfs_simple_attr.cocci warnings
Message-Id: <20181005203831.GF10285@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538736760-101310-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538736760-101310-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Tony Luck <tony.luck@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 05, 2018 at 10:52:40AM +0000, YueHaibing wrote:
> Use DEFINE_DEBUGFS_ATTRIBUTE rather than DEFINE_SIMPLE_ATTRIBUTE
> for debugfs files.
> 
> Semantic patch information:
> Rationale: DEFINE_SIMPLE_ATTRIBUTE + debugfs_create_file()
> imposes some significant overhead as compared to

What significant overhead? This commit message needs to explain what is
wrong with the use of DEFINE_DEBUGFS_ATTRIBUTE first.

> DEFINE_DEBUGFS_ATTRIBUTE + debugfs_create_file_unsafe().

Reading the comment over this function:

 * It is your responsibility to protect your struct file_operation
 * methods against file removals by means of debugfs_use_file_start()
 * and debugfs_use_file_finish(). ->open() is still protected by
 * debugfs though.

doesn't sound like something I'd want to additionally pay attention to.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
