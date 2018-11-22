From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Thu, 22 Nov 2018 09:22:26 +0000
Subject: Re: [PATCH][net-next] net: hinic: fix null pointer dereference on pointer hwdev
Message-Id: <7fe07c86-35c7-46d1-2d6e-dd3d4f0ff156@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181121195956.2730-1-colin.king@canonical.com>
In-Reply-To: <20181121195956.2730-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Aviad Krawczyk <aviad.krawczyk@huawei.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello!

On 21.11.2018 22:59, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer hwdev is being dereferenced when declaring hwif , however, later
> on hwdev is being null checked, hence we have dereference before null
> check error. Fix this by assigning hwiw and pdef only once hwdev has

    It's hwif, right?

> been null checked.
> 
> Detected by CoverityScan, CID#1485581 ("Dereference before null check")
> 
> Fixes: 4a61abb100c8 ("net-next/hinic:add rx checksum offload for HiNIC")
> 

    No need for this empty line.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
[...]

MBR, Sergei
