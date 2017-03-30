From: "Jorgen S. Hansen" <jhansen@vmware.com>
Date: Thu, 30 Mar 2017 13:18:10 +0000
Subject: Re: [PATCH][V2] VSOCK: remove unnecessary ternary operator on return value
Message-Id: <3658D20B-EBF9-48A2-95A7-026D36F18AF8@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170329153355.17525-1-colin.king@canonical.com>
In-Reply-To: <20170329153355.17525-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, "Michael S . Tsirkin" <mst@redhat.com>, Adit Ranadive <aditr@vmware.com>, George Zhang <georgezhang@vmware.com>, Stefan Hajnoczi <stefanha@redhat.com>, Julia Lawall <julia.lawall@lip6.fr>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


> On Mar 29, 2017, at 5:33 PM, Colin King <colin.king@canonical.com> wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Rather than assign the positive errno values to ret and then
> checking if it is positive and flip the sign, just return the
> errno value.
> 
> Detected by CoverityScan, CID#986649 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> net/vmw_vsock/vmci_transport.c | 22 +++++++---------------
> 1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
> index 4be4fbbc0b50..10ae7823a19d 100644
> --- a/net/vmw_vsock/vmci_transport.c
> +++ b/net/vmw_vsock/vmci_transport.c
> @@ -96,31 +96,23 @@ static int PROTOCOL_OVERRIDE = -1;
> 
> static s32 vmci_transport_error_to_vsock_error(s32 vmci_error)
> {
> -	int err;
> -
> 	switch (vmci_error) {
> 	case VMCI_ERROR_NO_MEM:
> -		err = ENOMEM;
> -		break;
> +		return -ENOMEM;
> 	case VMCI_ERROR_DUPLICATE_ENTRY:
> 	case VMCI_ERROR_ALREADY_EXISTS:
> -		err = EADDRINUSE;
> -		break;
> +		return -EADDRINUSE;
> 	case VMCI_ERROR_NO_ACCESS:
> -		err = EPERM;
> -		break;
> +		return -EPERM;
> 	case VMCI_ERROR_NO_RESOURCES:
> -		err = ENOBUFS;
> -		break;
> +		return -ENOBUFS;
> 	case VMCI_ERROR_INVALID_RESOURCE:
> -		err = EHOSTUNREACH;
> -		break;
> +		return -EHOSTUNREACH;
> 	case VMCI_ERROR_INVALID_ARGS:
> 	default:
> -		err = EINVAL;
> +		break;
> 	}
> -
> -	return err > 0 ? -err : err;
> +	return -EINVAL;
> }
> 
> static u32 vmci_transport_peer_rid(u32 peer_cid)
> -- 
> 2.11.0
> 

Reviewed-by: Jorgen Hansen <jhansen@vmware.com>

