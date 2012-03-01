From: bojan prtvar <prtvar.b@gmail.com>
Date: Thu, 01 Mar 2012 09:51:37 +0000
Subject: Re: [patch 1/4 v2] rndis_wlan: integer overflows in rndis_wlan_do_link_up_work()
Message-Id: <CAOmT4fS1jnywLoiMJjewFi2-w1UHySNPCEhAbrZwW01OS1hV6w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120229063555.GC18031@elgon.mountain>
	<4F4DE009.7010808@bfs.de>
	<20120301070208.GH1003@mwanda>
In-Reply-To: <20120301070208.GH1003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: walter harms <wharms@bfs.de>, Jussi Kivilinna <jussi.kivilinna@mbnet.fi>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,


On Thu, Mar 1, 2012 at 8:02 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
>
>
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Fixed a style issue for Walter Harms.  Changed > 0 to != 0.
>

Why not just  if (req_ie_len) and if (resp_ie_len) ?

Regards,
Bojan
