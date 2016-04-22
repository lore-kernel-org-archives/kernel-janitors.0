From: Mark yao <mark.yao@rock-chips.com>
Date: Fri, 22 Apr 2016 00:41:26 +0000
Subject: Re: [patch] drm/rockchip: inno_hdmi: fix an error code
Message-Id: <57197336.2060608@rock-chips.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160225213029.GA18267@mwanda> <56CFF00F.3030309@rock-chips.com>
 <20160421140354.GB17913@mwanda>
In-Reply-To: <20160421140354.GB17913@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Yakir Yang <ykk@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On 2016年04月21日 22:03, Dan Carpenter wrote:
> On Fri, Feb 26, 2016 at 02:26:23PM +0800, Yakir Yang wrote:
>> Dan,
>>
>> On 02/26/2016 05:30 AM, Dan Carpenter wrote:
>>> We were accidentally returning PTR_ERR(NULL) which means success when we
>>> wanted to return a negative error code.
>>>
>>> Fixes: 412d4ae6b7a5 ('drm/rockchip: hdmi: add Innosilicon HDMI support')
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Reviewed-by: Yakir Yang <ykk@rock-chips.com>
> We still need to apply this.
>
> regards,
> dan carpenter
>
>
>
>
Oh, Sorry, Miss this patch.

Applied to my drm-fixes.

Thanks.

-- 
Ｍark Yao


