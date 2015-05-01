From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 01 May 2015 18:42:36 +0000
Subject: Re: [PATCH 8/11] staging: lustre: obdclass: Use kzalloc and kfree
Message-Id: <alpine.DEB.2.02.1505012037550.2092@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr> <1430495482-933-5-git-send-email-Julia.Lawall@lip6.fr> <5543C660.8000303@bfs.de>
In-Reply-To: <5543C660.8000303@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Fri, 1 May 2015, walter harms wrote:

> hi Julia,
> your patch seems fine.
> I tried to understand the code and it seems that much of it
> can be simplified by using already available functions.
> I have added some comments but i am not sure what to make of it.

Thanks for the review.  Comments below.

> >  
> >  	len = strlen(LUSTRE_MGC_OBDNAME) + strlen(libcfs_nid2str(nid)) + 1;
> > -	OBD_ALLOC(mgcname, len);
> > -	OBD_ALLOC(niduuid, len + 2);
> > +	mgcname = kzalloc(len, GFP_NOFS);
> > +	niduuid = kzalloc(len + 2, GFP_NOFS);
> >  	if (!mgcname || !niduuid) {
> >  		rc = -ENOMEM;
> >  		goto out_free;
> 
>  this can be simplified by using
>    kasprintf(&mgcname,"%s%s", LUSTRE_MGC_OBDNAME, libcfs_nid2str(nid));
> 
>  is guess the some is true for niduuid

Thanks for the suggestion.  I will look into that next.  It may be 
applicable elsewhere.

> >  	/* Save the obdname for cleaning the nid uuids, which are
> >  	   obdname_XX */
> >  	len = strlen(obd->obd_name) + 6;
> > -	OBD_ALLOC(niduuid, len);
> > +	niduuid = kzalloc(len, GFP_NOFS);
> >  	if (niduuid) {
> >  		strcpy(niduuid, obd->obd_name);
> >  		ptr = niduuid + strlen(niduuid);
> 
> 	i guess kstrdup() would be appropiate

OK, I will check on this too.

> > @@ -895,7 +887,7 @@ static int lmd_parse_mgssec(struct lustr
> >  	int     length;
> >  
> >  	if (lmd->lmd_mgssec != NULL) {
> > -		OBD_FREE(lmd->lmd_mgssec, strlen(lmd->lmd_mgssec) + 1);
> > +		kfree(lmd->lmd_mgssec);
> >  		lmd->lmd_mgssec = NULL;
> >  	}
> 
> is the check needed hier at all ? just
> kfree(lmd->lmd_mgssec);
> seems to do the same job.

I'm working on that right at the moment.  Patch shortly.

> 
> >  
> > @@ -905,7 +897,7 @@ static int lmd_parse_mgssec(struct lustr
> >  	else
> >  		length = tail - ptr;
> >  
> > -	OBD_ALLOC(lmd->lmd_mgssec, length + 1);
> > +	lmd->lmd_mgssec = kzalloc(length + 1, GFP_NOFS);
> >  	if (lmd->lmd_mgssec = NULL)
> >  		return -ENOMEM;
> >  
> 
> 	complicated why to say:
> 	lmd->lmd_mgssec=kstrndup(ptr, length,GFP_NOFS);

OK, I will look into it.

> > @@ -933,7 +925,7 @@ static int lmd_parse_string(char **handl
> >  	else
> >  		length = tail - ptr;
> >  
> > -	OBD_ALLOC(*handle, length + 1);
> > +	*handle = kzalloc(length + 1, GFP_NOFS);
> >  	if (*handle = NULL)
> >  		return -ENOMEM;
> >  
> 
> lmd_parse_string() seems more or less the same as lmd_parse_mgssec().
> perhaps this can be merged.

I will check.

> > @@ -971,7 +963,7 @@ static int lmd_parse_mgs(struct lustre_m
> >  		/* Multiple mgsnid= are taken to mean failover locations */
> >  		memcpy(mgsnid, lmd->lmd_mgs, oldlen);
> >  		mgsnid[oldlen - 1] = ':';
> > -		OBD_FREE(lmd->lmd_mgs, oldlen);
> > +		kfree(lmd->lmd_mgs);
> >  	}
> >  	memcpy(mgsnid + oldlen, *ptr, length);
> >  	mgsnid[oldlen + length] = '\0';
> 
> the code lmd_parse_mgs basicly does:
>   kasprintf( &lmd->lmd_mgs,"%s:%s",lmd->lmd_mgs,*ptr);

OK.

thanks,
julia
