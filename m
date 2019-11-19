From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 19 Nov 2019 08:11:11 +0000
Subject: Re: [PATCH -next] vsock/vmci: make vmci_vsock_cb_host_called static
Message-Id: <20191119081111.gz2adojvsdcukvwk@steredhat.homenet.telecomitalia.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119032534.52090-1-maowenan@huawei.com>
In-Reply-To: <20191119032534.52090-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, netdev@vger.kernel.org, davem@davemloft.net
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, alexios.zavras@intel.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Tue, Nov 19, 2019 at 11:25:34AM +0800, Mao Wenan wrote:
> When using make C=2 drivers/misc/vmw_vmci/vmci_driver.o
> to compile, below warning can be seen:
> drivers/misc/vmw_vmci/vmci_driver.c:33:6: warning:
> symbol 'vmci_vsock_cb_host_called' was not declared. Should it be static?
> 
> This patch make symbol vmci_vsock_cb_host_called static.
> 
> Fixes: b1bba80a4376 ("vsock/vmci: register vmci_transport only when VMCI guest/host are active")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/misc/vmw_vmci/vmci_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/vmw_vmci/vmci_driver.c b/drivers/misc/vmw_vmci/vmci_driver.c
> index 95fed46..cbb706d 100644
> --- a/drivers/misc/vmw_vmci/vmci_driver.c
> +++ b/drivers/misc/vmw_vmci/vmci_driver.c
> @@ -30,7 +30,7 @@ static bool vmci_host_personality_initialized;
>  
>  static DEFINE_MUTEX(vmci_vsock_mutex); /* protects vmci_vsock_transport_cb */
>  static vmci_vsock_cb vmci_vsock_transport_cb;
> -bool vmci_vsock_cb_host_called;
> +static bool vmci_vsock_cb_host_called;
>  
>  /*
>   * vmci_get_context_id() - Gets the current context ID.
> -- 
> 2.7.4
> 

Same patch already sent by "kbuild test robot" <lkp@intel.com>
https://lkml.org/lkml/2019/11/18/609

If we want to merge this, maybe we can also add:
Reported-by: kbuild test robot <lkp@intel.com>

Anyway, it is my fault:
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
