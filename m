From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Mar 2016 18:28:15 +0000
Subject: Re: [patch] [media] am437x-vpfe: fix an uninitialized variable bug
Message-Id: <CA+V-a8tpSbiUqjvV8CMY8=HUA1ZuPD1RTw2s5=+3z=g+DCpkeA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160315070412.GA13560@mwanda>
In-Reply-To: <20160315070412.GA13560@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benoit Parrot <bparrot@ti.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

On Tue, Mar 15, 2016 at 7:04 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> If we are doing V4L2_FIELD_NONE then "ret" is used uninitialized.
>
> Fixes: 417d2e507edc ('[media] media: platform: add VPFE capture driver support for AM437X')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
Acked-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad
