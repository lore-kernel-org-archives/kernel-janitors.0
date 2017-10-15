From: "Jasmin J." <jasmin@anw.at>
Date: Sun, 15 Oct 2017 13:51:07 +0000
Subject: Re: [PATCH] media: dvb_ca_en50221: sanity check slot number from userspace
Message-Id: <70193c32-abed-aaac-f827-1588d203e8cd@anw.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170920221959.5979-1-colin.king@canonical.com>
In-Reply-To: <20170920221959.5979-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ralph Metzler <rjkm@metzlerbros.de>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Good catch!

> Seems that this bug has been in the driver forever.
Indeed ... and I overlooked it during my recent changes to that module.

Reviewed-by: Jasmin Jessich <jasmin@anw.at>

BR,
   Jasmin
