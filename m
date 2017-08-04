From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 04 Aug 2017 08:48:45 +0000
Subject: Re: [PATCH] tee: constify tee_driver_ops and tee_desc structures
Message-Id: <CAHUa44G4um5zFbKfNXaWuy6skCuM63Ur4dEHUmTjQcBz1uPdtw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501787391-13965-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501787391-13965-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>

On Thu, Aug 3, 2017 at 9:09 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> tee_driver_ops structures are only stored in the ops field of tee_desc
> structures, which is const, and in turn tee_desc structures are only passed
> as the first argument of tee_device_alloc, and this argument is const as
> well.  Thus the two kinds of structures can be const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

This has already been proposed by Bhumika Goyal in a more or less
identical patch. I've already picked up Bhumikas patch and will send
it upstream via arm-soc.

Thanks,
Jens
