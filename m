From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Oct 2017 06:44:38 +0000
Subject: Re: drm/rcar-du: Adjust 14 checks for null pointers
Message-Id: <2d491a67-184a-c03f-e6ee-da88066e97f0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7d5e68c7-2d64-0131-1a08-eeb4e03cc113@users.sourceforge.net>
 <2dd8c930-77e8-a2ee-6356-fc9c1d21384d@users.sourceforge.net>
 <20171025060209.pqtyqk4weduvmzxj@mwanda>
In-Reply-To: <20171025060209.pqtyqk4weduvmzxj@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> The script “checkpatch.pl” pointed information out like the following.
>>
>> Comparison to NULL could be written !…
>>
>> Thus fix the affected source code places.
>>
> 
> This one is fine

This kind of feedback is nice.


> except for the commit message.

Would you like to support Unicode characters there?

Regards,
Markus
