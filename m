From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 09 Jan 2019 13:24:12 +0000
Subject: Re: [PATCH net] selftests/txtimestamp: Fix an equals vs assign bug
Message-Id: <CAF=yD-KSFzCo1PjpcG=822WxVBNMmYZkNKaACC9Z8kysPbQuFw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190109105007.GA14518@kadam>
In-Reply-To: <20190109105007.GA14518@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jan 9, 2019 at 5:52 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This should be = instead of =.
>
> Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Willem de Bruijn <willemb@google.com>

Thanks for the fix, Dan.
