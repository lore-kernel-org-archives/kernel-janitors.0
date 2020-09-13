From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sun, 13 Sep 2020 13:13:08 +0000
Subject: Re: [PATCH] tee/tee_shm.c: Fix error handling path
Message-Id: <CAFqt6zYA4srnsGx+OzrzVuzasOvUQR+dN0nmVZcv1zVeotxKUA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <641dfe3b-1de8-97ea-eac7-89d81846eab3@web.de>
In-Reply-To: <641dfe3b-1de8-97ea-eac7-89d81846eab3@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>, John Hubbard <jhubbard@nvidia.com>

On Sun, Sep 13, 2020 at 2:00 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > When shm->num_pages <= 0, we should avoid calling
> > release_registered_pages() in error handling path.
>
> * Would an imperative wording become helpful for the change description?
>
> * I suggest to add the tag “Fixes” to the commit message.

Sure. Will address both in v2.
>
> Regards,
> Markus
