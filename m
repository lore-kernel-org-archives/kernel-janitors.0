From: Chuck Lever <chuck.lever@oracle.com>
Date: Tue, 17 Jul 2012 00:52:18 +0000
Subject: Re: [nfs:nfs-for-bryan 100/100] net/sunrpc/auth_gss/gss_mech_switch.c:252:5: sparse: context imbalan
Message-Id: <02CE41D1-F797-4363-8109-A5B2C8AD6E95@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120717001410.GD16944@localhost>
In-Reply-To: <20120717001410.GD16944@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, Linux-NFS <linux-nfs@vger.kernel.org>


On Jul 16, 2012, at 8:14 PM, Fengguang Wu wrote:

> Hi Chuck,
> 
> There are new sparse warnings (likely a true locking bug) show up in
> 
> tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git nfs-for-bryan
> head:   6a1a1e34dc55f17e7bd260809207442dbb7a0296
> commit: 6a1a1e34dc55f17e7bd260809207442dbb7a0296 [100/100] SUNRPC: Add rpcauth_list_flavors()
> 
> All sparse warnings:
> 
>  net/sunrpc/auth_gss/gss_mech_switch.c:143:21: sparse: symbol '_gss_mech_get_by_name' was not declared. Should it be static?
>  net/sunrpc/auth_gss/gss_mech_switch.c:208:21: sparse: symbol '_gss_mech_get_by_pseudoflavor' was not declared. Should it be static?
> + net/sunrpc/auth_gss/gss_mech_switch.c:252:5: sparse: context imbalance in 'gss_mech_list_pseudoflavors' - wrong count at exit

gss_mech_list_pseudoflavors() is missing a spin_unlock() before the "return -ENOMEM;".

> vim +252 net/sunrpc/auth_gss/gss_mech_switch.c
>   249	 * The returned array is not sorted by any policy.  Callers should not
>   250	 * rely on the order of the items in the returned array.
>   251	 */
>> 252	int gss_mech_list_pseudoflavors(rpc_authflavor_t *array_ptr, int size)
>   253	{
>   254		struct gss_api_mech *pos = NULL;
>   255		int j, i = 0;

-- 
Chuck Lever
chuck[dot]lever[at]oracle[dot]com




