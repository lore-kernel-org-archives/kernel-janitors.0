From: Matan Barak <matanb@dev.mellanox.co.il>
Date: Wed, 14 Jun 2017 09:57:42 +0000
Subject: Re: [PATCH] IB/mlx5: Fix a warning message
Message-Id: <CAAKD3BDGH1STMhcCgz=K6-8EtnGGOYkx7KPS+iPidUiuLmpjNw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614091556.GF29394@elgon.mountain> <CAAKD3BDG9aOcLU9vEL1u8Yn23QpsZCjjN-y5DbKq5zBrvYJK=A@mail.gmail.com>
 <20170614095228.z27m247t5k2si6fz@mwanda>
In-Reply-To: <20170614095228.z27m247t5k2si6fz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matan Barak <matanb@mellanox.com>, Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leonro@mellanox.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma <linux-rdma@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 12:52 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> On Wed, Jun 14, 2017 at 12:19:57PM +0300, Matan Barak wrote:
>> On Wed, Jun 14, 2017 at 12:15 PM, Dan Carpenter
>> <dan.carpenter@oracle.com> wrote:
>> > "umem" is a valid pointer.  We intended to print "*umem" instead.
>> >
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> >
>> > diff --git a/drivers/infiniband/hw/mlx5/mr.c b/drivers/infiniband/hw/mlx5/mr.c
>> > index 763bb5b36144..86af54b0e414 100644
>> > --- a/drivers/infiniband/hw/mlx5/mr.c
>> > +++ b/drivers/infiniband/hw/mlx5/mr.c
>> > @@ -825,7 +825,7 @@ static int mr_umem_get(struct ib_pd *pd, u64 start, u64 length,
>> >                             access_flags, 0);
>> >         err = PTR_ERR_OR_ZERO(*umem);
>> >         if (err < 0) {
>> > -               mlx5_ib_err(dev, "umem get failed (%ld)\n", PTR_ERR(umem));
>> > +               mlx5_ib_err(dev, "umem get failed (%ld)\n", PTR_ERR(*umem));
>>
>> I think it's better just to print err :)
>>
>
> I don't understand what you're saying.
>

mlx5_ib_err(dev, "umem get failed (%d)\n", err);

> regards,
> dan carpenter
>

Thanks,
Matan
