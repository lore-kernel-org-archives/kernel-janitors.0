From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Oct 2018 07:38:50 +0000
Subject: Re: [PATCH] scsi: lpfc: Uninitialized variable in lpfc_debugfs_nodelist_data()
Message-Id: <20181022073850.q46hjayb2sp5wpmn@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181022065023.kxoqxbghtfh3yox2@kili.mountain>
In-Reply-To: <20181022065023.kxoqxbghtfh3yox2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 22, 2018 at 08:25:49AM +0100, James Bottomley wrote:
> On Mon, 2018-10-22 at 09:50 +0300, Dan Carpenter wrote:
> > There was a merge problem and we accidentally removed the "nrport"
> > initialization.
> > 
> > Fixes: 77c5bf5647b5 ("Merge branch 'misc' into for-next")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/scsi/lpfc/lpfc_debugfs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/scsi/lpfc/lpfc_debugfs.c
> > b/drivers/scsi/lpfc/lpfc_debugfs.c
> > index c6912394b56d..0c8005bb0f53 100644
> > --- a/drivers/scsi/lpfc/lpfc_debugfs.c
> > +++ b/drivers/scsi/lpfc/lpfc_debugfs.c
> > @@ -550,7 +550,7 @@ lpfc_debugfs_nodelist_data(struct lpfc_vport
> > *vport, char *buf, int size)
> >  	struct lpfc_nodelist *ndlp;
> >  	unsigned char *statep;
> >  	struct nvme_fc_local_port *localport;
> > -	struct nvme_fc_remote_port *nrport;
> > +	struct nvme_fc_remote_port *nrport = NULL;
> 
> Really? that's not the way I did the merge in my for-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git/commit/?h=for-next&id86cc958e2a60cef07546b15bdce90713a05e80
> 
> 77c5bf5647b5 looks to be the orphaned residue of a failed merge ... how
> did you find it because it's not in any of the public branches?

It was in Friday's linux-next.  Anyway, so long as it was fixed now.

regards,
dan carpenter
