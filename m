From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 02 Jan 2018 22:22:01 +0000
Subject: Re: [PATCH] net: systemport: Delete an error message for a failed memory allocation in two functions
Message-Id: <3040d287-5f0a-e55a-8e7a-2f1a74ed27c1@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5852a936-de6d-f292-2791-b8469b5f8947@users.sourceforge.net>
In-Reply-To: <5852a936-de6d-f292-2791-b8469b5f8947@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, netdev@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org



On 01/01/2018 08:54 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 Jan 2018 17:50:02 +0100
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
