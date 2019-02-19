From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Feb 2019 13:25:31 +0000
Subject: [bug report] tee: add supp_nowait flag in tee_context struct
Message-Id: <20190219132531.GA7458@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sumit Garg,

The patch 42bf4152d8a7: "tee: add supp_nowait flag in tee_context
struct" from Jan 29, 2019, leads to the following static checker
warning:

	drivers/tee/tee_core.c:996 tee_client_open_context()
	error: 'ctx' dereferencing possible ERR_PTR()

drivers/tee/tee_core.c
    986 	} while (IS_ERR(ctx) && PTR_ERR(ctx) != -ENOMEM);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^
ctx can be ERR_PTR(-ENOMEM);

    987 
    988 	put_device(put_dev);
    989 	/*
    990 	 * Default behaviour for in kernel client is to not wait for
    991 	 * tee-supplicant if not present for any requests in this context.
    992 	 * Also this flag could be configured again before call to
    993 	 * tee_client_open_session() if any in kernel client requires
    994 	 * different behaviour.
    995 	 */
--> 996 	ctx->supp_nowait = true;
                ^^^^^^^^^^^^^^^^
And it leads to an Oops here.

    997 	return ctx;
    998 }

regards,
dan carpenter
