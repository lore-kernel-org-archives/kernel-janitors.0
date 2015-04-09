From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Apr 2015 12:35:02 +0000
Subject: Re: [PATCH 1/2] ide: remove deprecated use of pci api
Message-Id: <20150409123502.GM10964@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428579988-10167-1-git-send-email-lambert.quentin@gmail.com>
 <1428579988-10167-2-git-send-email-lambert.quentin@gmail.com>
In-Reply-To: <1428579988-10167-2-git-send-email-lambert.quentin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Why are these GFP_ATOMIC allocations?

regards,
dan carpenter

