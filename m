From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Feb 2019 17:01:34 +0000
Subject: Re: [PATCH -next] hwrng: make symbol 'optee_rng_id_table' static
Message-Id: <CAK8P3a3cPcBhFZkGKXEqJJtx-p_pNZ6M6gJQuXsoAdSENNrGUg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220093458.159208-1-weiyongjun1@huawei.com>
 <CAFA6WYODEymSPh6gQjUL3wRmoPy=zoMv-Z1Q1TbKtWFH=UUgMw@mail.gmail.com>
 <CAKv+Gu9yWEVvvoh8KOX1waZUrM1hy+P99Rxh3U2nPYE_sgyJzQ@mail.gmail.com>
 <8a3ff7ae-9257-82f1-70e2-91cc77aa7377@canonical.com> <CAFA6WYMU0GwYaOgyoCAKSUat0kHOGRnV6UWG0Co0EfHrpO4ryA@mail.gmail.com>
 <CAK8P3a3FMa9tpw4rj+8Aue2EYxxKSD4nxdwRFrzac_87Kzio5g@mail.gmail.com> <CAFA6WYNCxGTqw6LKUPK-ceWD1NbAhJQmzrH5fwOVRP5f2Auz2Q@mail.gmail.com>
In-Reply-To: <CAFA6WYNCxGTqw6LKUPK-ceWD1NbAhJQmzrH5fwOVRP5f2Auz2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Colin Ian King <colin.king@canonical.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, Wei Yongjun <weiyongjun1@huawei.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" <linux-crypto@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Feb 20, 2019 at 5:26 PM Sumit Garg <sumit.garg@linaro.org> wrote:
> On Wed, 20 Feb 2019 at 21:04, Arnd Bergmann <arnd@arndb.de> wrote:

> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
>
> There are already fixes sent in upstream for these. Maybe you could
> pick those too.
>
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1935826.html
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1935849.html
>
> One more reported by Dan Carpenter here:
>
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1936881.html
>

Applied all for now, thanks a lot!

      Arnd
