From: WANG Cong <xiyou.wangcong@gmail.com>
Date: Fri, 21 Jan 2011 08:06:22 +0000
Subject: Re: [PATCH] acpi: debugfs: fix buffer overflows, double free
Message-Id: <ihbepu$jbj$2@dough.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295554086-23873-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-acpi@vger.kernel.org

On Thu, 20 Jan 2011 23:08:06 +0300, Vasiliy Kulikov wrote:

> File position is not controlled, it may lead to overwrites of arbitrary
> kernel memory.  Also the code may kfree() the same pointer multiple
> times.
> 
> One more flaw is still present: if multiple processes open the file then
> all 3 static variables are shared, leading to various race conditions.
> They should be moved to file->private_data.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>

Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>

Thanks.

