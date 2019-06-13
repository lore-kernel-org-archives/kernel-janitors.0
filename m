From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 13 Jun 2019 13:26:39 +0000
Subject: Re: [PATCH] NTB: amd: Silence shift wrapping warning in amd_ntb_db_vector_mask()
Message-Id: <20190613132638.GD1572@kudzu.us>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190325092326.GE16023@kadam>
In-Reply-To: <20190325092326.GE16023@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 26, 2019 at 05:46:44AM +0000, S-k, Shyam-sundar wrote:
> On 3/25/2019 2:53 PM, Dan Carpenter wrote:
> > This code triggers a Smatch warning:
> >
> >     drivers/ntb/hw/amd/ntb_hw_amd.c:336 amd_ntb_db_vector_mask()
> >     warn: should '(1 << db_vector)' be a 64 bit type?
> >
> > I don't think "db_vector" can be higher than 16 so this doesn't affect
> > runtime, but it's nice to silence the static checker warning and we
> > might increase "ndev->db_count" in the future.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Sorry for the delay.  The patch is now in the ntb branch.  We've
missed window for 5.2, but it will be in the 5.3 pull request.

Thanks,
Jon
