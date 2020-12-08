From: Jeff Layton <jlayton@kernel.org>
Date: Tue, 08 Dec 2020 12:34:13 +0000
Subject: Re: [PATCH] ceph: remove redundant assignment to variable i
Message-Id: <58d2f1c5a9ce13f8aecda76604cca35c5165c66d.camel@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201204185421.1149669-1-colin.king@canonical.com>
In-Reply-To: <20201204185421.1149669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2020-12-04 at 18:54 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable i is being initialized with a value that is never read
> and it is being updated later with a new value in a for-loop.  The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/ceph/mds_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
> index 8f1d7500a7ec..b70937caa7a7 100644
> --- a/fs/ceph/mds_client.c
> +++ b/fs/ceph/mds_client.c
> @@ -1243,7 +1243,7 @@ static struct ceph_msg *create_session_open_msg(struct ceph_mds_client *mdsc, u6
>  {
>  	struct ceph_msg *msg;
>  	struct ceph_mds_session_head *h;
> -	int i = -1;
> +	int i;
>  	int extra_bytes = 0;
>  	int metadata_key_count = 0;
>  	struct ceph_options *opt = mdsc->fsc->client->options;

Meh, ok. Merged into ceph-client/testing branch. It should make v5.11.

Thanks,
-- 
Jeff Layton <jlayton@kernel.org>
