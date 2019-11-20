From: Lyude Paul <lyude@redhat.com>
Date: Wed, 20 Nov 2019 19:18:17 +0000
Subject: Re: [PATCH][next] drm/dp_mst: fix multiple frees of tx->bytes
Message-Id: <a0e277e23dc540c66d075305a0a9c6903e81de48.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191120173509.347490-1-colin.king@canonical.com>
         <f6c44c85a63c89e548cafa55d89caccd7e868268.camel@redhat.com>
         <0e6b2b68-2898-213d-3a37-c23d32a97133@canonical.com>
In-Reply-To: <0e6b2b68-2898-213d-3a37-c23d32a97133@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2019-11-20 at 19:11 +0000, Colin Ian King wrote:
> On 20/11/2019 18:59, Lyude Paul wrote:
> > Heh, surprised I missed this one!
> > 
> > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > 
> > Do you need me to push this to drm-misc, or do you have commit rights
> > already
> 
> I have no commit rights.

Gotcha:

Enumerating objects: 11, done.
Counting objects: 100% (11/11), done.
Delta compression using up to 4 threads
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 885 bytes | 442.00 KiB/s, done.
Total 6 (delta 5), reused 0 (delta 0)
To ssh://git.freedesktop.org/git/drm/drm-misc
   8896e40c05cc..2c8bc91488fc  drm-misc-next -> drm-misc-next
Pushing drm-misc-fixes to for-linux-next-fixes... Everything up-to-date
Done.
Pushing drm-misc-next-fixes to for-linux-next... Everything up-to-date
Done.
Updating rerere cache... Done.
Reloading nightly.conf... Done.
Fetching drm-amd... Done.
Fetching drm-intel... Done.
Fetching sound-upstream (local remote sound)... Done.
Fetching drm... Done.
Fetching drm-misc... Done.
Fetching linux-upstream (local remote origin)... Done.
Fetching drm-tip... Done.
Merging drm/drm-fixes... Reset. Done.
Merging drm-misc/drm-misc-fixes... Fast-forward. Done.
Merging drm-intel/drm-intel-fixes... Fast-forward. Done.
Merging drm-amd/drm-amd-fixes... Fast-forward. Done.
Merging drm/drm-next... Done.
Merging drm-misc/drm-misc-next-fixes... Done.
Merging drm-intel/drm-intel-next-fixes... Done.
Merging drm-amd/drm-amd-next-fixes... Fast-forward. Done.
Merging drm-misc/drm-misc-next... Done.
Merging drm-intel/drm-intel-next-queued... Done.
Merging drm-intel/drm-intel-next... Fast-forward. Done.
Merging drm-amd/drm-amd-next... Fast-forward. Done.
Merging sound-upstream/for-linus (local remote sound)... Fast-forward. Done.
Merging sound-upstream/for-next (local remote sound)... Done.
Merging drm-intel/topic/core-for-CI... Done.
Adding integration manifest drm-tip: 2019y-11m-20d-19h-16m-39s UTC... Done.
Pushing drm-tip... Done.
Finalizing rerere cache... Nothing changed. Pushing rerere cache... Done.

Thanks for the patch!
> 
> 
> > On Wed, 2019-11-20 at 17:35 +0000, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > Currently tx->bytes is being freed r->num_transactions number of
> > > times because tx is not being set correctly. Fix this by setting
> > > tx to &r->transactions[i] so that the correct objects are being
> > > freed on each loop iteration.
> > > 
> > > Addresses-Coverity: ("Double free")
> > > Fixes: 2f015ec6eab6 ("drm/dp_mst: Add sideband down request tracing +
> > > selftests")
> > > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > > ---
> > >  drivers/gpu/drm/drm_dp_mst_topology.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > index ae5809a1f19a..2754e7e075e7 100644
> > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > @@ -517,8 +517,10 @@ drm_dp_decode_sideband_req(const struct
> > > drm_dp_sideband_msg_tx *raw,
> > >  			}
> > >  
> > >  			if (failed) {
> > > -				for (i = 0; i < r->num_transactions; i++)
> > > +				for (i = 0; i < r->num_transactions; i++) {
> > > +					tx = &r->transactions[i];
> > >  					kfree(tx->bytes);
> > > +				}
> > >  				return -ENOMEM;
> > >  			}
> > >  
-- 
Cheers,
	Lyude Paul
