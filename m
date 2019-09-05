From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 05 Sep 2019 08:38:48 +0000
Subject: Re: drm/amdgpu: remove the redundant null check
Message-Id: <dd351754-cb3a-b19a-64e1-f2f583c2a23a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1567491305-18320-1-git-send-email-zhongjiang@huawei.com>
 <62b33279-9ca9-5970-5336-a8511ce54197@web.de> <5D70A196.3020106@huawei.com>
In-Reply-To: <5D70A196.3020106@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: zhong jiang <zhongjiang@huawei.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Were any source code analysis tools involved for finding
>> these update candidates?
> With the help of Coccinelle. You can find out some example in scripts/coccinelle/.

Thanks for such background information.
Was the script “ifnullfree.cocci” applied here?

Will it be helpful to add attribution for such tools
to any more descriptions in your patches?

Regards,
Markus
