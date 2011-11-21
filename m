From: "Kasatkin, Dmitry" <dmitry.kasatkin@intel.com>
Date: Mon, 21 Nov 2011 15:18:45 +0000
Subject: Re: [patch] mpi/mpi-mpow: NULL dereference on allocation failure
Message-Id: <CALLzPKYPp6-ov5HjY9yP1iO3MWBtysVeai+CudRS7R+DVZXgEw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111121145056.GB19092@elgon.mountain>
In-Reply-To: <20111121145056.GB19092@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, James Morris <jmorris@namei.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 21, 2011 at 4:50 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We can't call mpi_free() on the elements if the first kzalloc() fails.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Dmitry Kasatkin <dmitry.kasatkin@intel.com>

>
> diff --git a/lib/mpi/mpi-mpow.c b/lib/mpi/mpi-mpow.c
> index 4cc7593..7328d0d 100644
> --- a/lib/mpi/mpi-mpow.c
> +++ b/lib/mpi/mpi-mpow.c
> @@ -73,7 +73,7 @@ int mpi_mulpowm(MPI res, MPI *basearray, MPI *exparray, MPI m)
>
>        G = kzalloc((1 << k) * sizeof *G, GFP_KERNEL);
>        if (!G)
> -               goto nomem;
> +               goto err_out;
>
>        /* and calculate */
>        tmp = mpi_alloc(mpi_get_nlimbs(m) + 1);
> @@ -129,5 +129,6 @@ nomem:
>        for (i = 0; i < (1 << k); i++)
>                mpi_free(G[i]);
>        kfree(G);
> +err_out:
>        return rc;
>  }
>
