From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Aug 2020 15:42:13 +0000
Subject: Re: [PATCH] drm: amdgpu: Use the correct size when allocating memory
Message-Id: <20200810154213.GM1793@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200809203406.751971-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ori.Messinger@amd.com, airlied@linux.ie, bernard@vivo.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, sumit.semwal@linaro.org, colton.w.lewis@protonmail.com, amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, m.szyprowski@samsung.com

On Sun, Aug 09, 2020 at 10:34:06PM +0200, Christophe JAILLET wrote:
> When '*sgt' is allocated, we must allocated 'sizeof(**sgt)' bytes instead
> of 'sizeof(*sg)'. 'sg' (i.e. struct scatterlist) is smaller than
> 'sgt' (i.e struct sg_table), so this could lead to memory corruption.

The sizeof(*sg) is bigger than sizeof(**sgt) so this wastes memory but
it won't lead to corruption.

    11  struct scatterlist {
    12          unsigned long   page_link;
    13          unsigned int    offset;
    14          unsigned int    length;
    15          dma_addr_t      dma_address;
    16  #ifdef CONFIG_NEED_SG_DMA_LENGTH
    17          unsigned int    dma_length;
    18  #endif
    19  };

    42  struct sg_table {
    43          struct scatterlist *sgl;        /* the list */
    44          unsigned int nents;             /* number of mapped entries */
    45          unsigned int orig_nents;        /* original size of list */
    46  };

regards,
dan carpenter
