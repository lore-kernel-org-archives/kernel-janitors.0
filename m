From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Date: Fri, 31 Jan 2020 10:15:43 +0000
Subject: Re: [PATCH net] ice: Fix a couple off by one bugs
Message-Id: <20200131101543.GA4872@ranger.igk.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200131045658.ahliv7jvubpwoeru@kili.mountain>
In-Reply-To: <20200131045658.ahliv7jvubpwoeru@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, "David S. Miller" <davem@davemloft.net>, Henry Tieman <henry.w.tieman@intel.com>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 31, 2020 at 07:56:59AM +0300, Dan Carpenter wrote:
> The hw->blk[blk]->es.ref_count[] array has hw->blk[blk].es.count
> elements.  It gets allocated in ice_init_hw_tbls().  So the > should be
> >= to prevent accessing one element beyond the end of the array.
> 
> Fixes: 2c61054c5fda ("ice: Optimize table usage")

You should also provide:
Fixes: 31ad4e4ee1e4 ("ice: Allocate flow profile")

prof_id can be 0 so thanks for catching this. You can take my:
Acked-by: Maciej Fijalkowski <maciej.fijalkowski@intel.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_flex_pipe.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
> index 99208946224c..38a7041fe774 100644
> --- a/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
> +++ b/drivers/net/ethernet/intel/ice/ice_flex_pipe.c
> @@ -1950,7 +1950,7 @@ ice_free_prof_id(struct ice_hw *hw, enum ice_block blk, u8 prof_id)
>  static enum ice_status
>  ice_prof_inc_ref(struct ice_hw *hw, enum ice_block blk, u8 prof_id)
>  {
> -	if (prof_id > hw->blk[blk].es.count)
> +	if (prof_id >= hw->blk[blk].es.count)
>  		return ICE_ERR_PARAM;
>  
>  	hw->blk[blk].es.ref_count[prof_id]++;
> @@ -1991,7 +1991,7 @@ ice_write_es(struct ice_hw *hw, enum ice_block blk, u8 prof_id,
>  static enum ice_status
>  ice_prof_dec_ref(struct ice_hw *hw, enum ice_block blk, u8 prof_id)
>  {
> -	if (prof_id > hw->blk[blk].es.count)
> +	if (prof_id >= hw->blk[blk].es.count)
>  		return ICE_ERR_PARAM;
>  
>  	if (hw->blk[blk].es.ref_count[prof_id] > 0) {
> -- 
> 2.11.0
> 
