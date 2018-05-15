From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Date: Tue, 15 May 2018 09:46:41 +0000
Subject: Re: [PATCH 27/61] media: platform: s5p-mfc: simplify getting .drvdata
Message-Id: <0684984f-6e52-5e91-f6bb-1084c588e1b4@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-28-wsa+renesas@sang-engineering.com>
 <CGME20180515094647epcas1p49b3c5d47dcedd034aec9589aab473cc0@epcas1p4.samsung.com>
In-Reply-To: <20180419140641.27926-28-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 04/19/2018 04:05 PM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
