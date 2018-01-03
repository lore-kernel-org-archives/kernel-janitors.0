From: Tariq Toukan <tariqt@mellanox.com>
Date: Wed, 03 Jan 2018 07:58:39 +0000
Subject: Re: [PATCH] ethernet: mlx4: Delete an error message for a failed memory allocation in five functions
Message-Id: <0fea8f2f-f8fc-ce2e-3d33-44227de3637a@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <30191db0-4d99-0349-b66a-c7354ef90d50@users.sourceforge.net>
In-Reply-To: <30191db0-4d99-0349-b66a-c7354ef90d50@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, Tariq Toukan <tariqt@mellanox.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 01/01/2018 10:46 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 Jan 2018 21:42:27 +0100
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Is this an issue? Why? What is your motivation?
These are error messages, very informative, appear only upon errors, and 
in control flow.
