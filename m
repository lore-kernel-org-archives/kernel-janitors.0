From: Eugene Teo <eugeneteo@kernel.sg>
Date: Fri, 21 Jan 2011 09:37:49 +0000
Subject: Re: [PATCH] acpi: debugfs: fix buffer overflows, double free
Message-Id: <AANLkTik3TT-0L3OOw2t19tufnOKtLBSCUt91S5V6cg6N@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295554086-23873-1-git-send-email-segoon@openwall.com>
	<ihbepu$jbj$2@dough.gmane.org>
In-Reply-To: <ihbepu$jbj$2@dough.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: WANG Cong <xiyou.wangcong@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/21/11, WANG Cong <xiyou.wangcong@gmail.com> wrote:
> On Thu, 20 Jan 2011 23:08:06 +0300, Vasiliy Kulikov wrote:
>
>> File position is not controlled, it may lead to overwrites of arbitrary
>> kernel memory.  Also the code may kfree() the same pointer multiple
>> times.
>>
>> One more flaw is still present: if multiple processes open the file then
>> all 3 static variables are shared, leading to various race conditions.
>> They should be moved to file->private_data.
>>
>> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
>
> Reviewed-by: WANG Cong <xiyou.wangcong@gmail.com>

Reviewed-by: Eugene Teo <eugeneteo@kernel.org>

Thanks, Eugene
