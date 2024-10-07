Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3A42077
	for <kernel-janitors@vger.kernel.org>; Mon,  7 Oct 2024 06:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728282372; cv=none; b=U2IHnAeGSLR9GjJQZwWbgAn57RwFCUCUD40Yd8SxwJHVK9GlZ1BrPomBAeLSJUd6c3mpWmAc3+hBB5D8TMeGtRTfg5KESzpcM9lxFFKWdnOzu/9R2TiQuxWEDSmGFS++/aVzgXb9GFPuyUBEU7cG45Wm+9wm9eB2Cqfs/wJPiTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728282372; c=relaxed/simple;
	bh=43HaKXVOs++v9aRwBPGS/kKu5bdHIZJlrskCoMSFces=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDiZzoa3n5KafNTpcAe4CLX4D93jFoDA2v3i8mGa1s4BuHwsyk5EKyGuA2F++KqGYY6jiB7gkhWEXBataMSxHzL9gHLQMq6w8wcCsse10zDS2aOg+aqfCCw/UqBs3CX9sdCdtyjA+JiaknDNCrIOVKeVlszd8+rUPmzjChuzNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pAXdSHLS; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pAXdSHLS"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so40865365e9.3
        for <kernel-janitors@vger.kernel.org>; Sun, 06 Oct 2024 23:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728282368; x=1728887168; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e9C1oBpVT8hlfZaolfPFSsrx2JJCp/QCHAU5+yTb4nY=;
        b=pAXdSHLS8fcpm0EaJEuABpz0LiFKGDY3df4CDiBASOGwtBnu8tgpmYXyirJneAQSys
         AgZFdNlbwDSrMbo2AmD+8trxTOwCCF6RWz1ktGibSKzHgc6TSfrOtqpv5/PIjk/k6lKv
         FgsSLdv/GxBPqCSBLuIADKwgGAhSRks8Fxt95UUE/I0IPDDgcv6eip29tK8uElbLqUjl
         J2UAYZrV/RJRXql/IvAXalkHmdYj6LtBUl3Cz00aqpIoOXtM3OyacXqSW76sM1Cq/o7O
         f7Hsw7/RpDHChPY2Z66MMSZMj8AGAi2fl+U1yqnhNq0bEXs/6YGC9Omqgk/TO/gERS97
         bYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728282368; x=1728887168;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9C1oBpVT8hlfZaolfPFSsrx2JJCp/QCHAU5+yTb4nY=;
        b=HQVYDa4T51VVABnt/H/OukrzvG/02GsjOgQ1OpSdNwoXyCcyaf3oLDb2jAXednqi0W
         KZJffjHmypgPA85mombwpf1+uXCk5jMzpdz76x9q4Ez5LDrQV+UBVg1TupMw6rwOvI2K
         HATbypsxV5/7kyqzfifSzXliqlz1y3farL+HKJ20i3neD6rkSRnx62IaNb1dJMVRm97A
         H+P+50myHdpxTFp2p4h2b67N2ghdyPQeCfA+ScfOAkael4CEcvNN5CJBD8iQXqaqwYSH
         XOGrxaBckVdkSTMHLzWMGk+4X2E0jttddOxwu4z7YKw7fi5yvOlglrwjlkiTqAnFthav
         o8jw==
X-Forwarded-Encrypted: i=1; AJvYcCU5fs+SJndLA11MPI0Iqmc1dfLW+RPcw7gVZa+A4J1GxolEsKfVBmL+hljXW3/7D6HeSX/GbZLkETv7cSD1zVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPanXlDDN11b2Ge9stazT9TBKQsfJqXz+LUJemYYdvajVzlPP
	6hhO62OZUE1PlX/2IfVN+tZaaqOM9tayso/32TMd+S9c8blfZV/a22EQs1tkKEY=
X-Google-Smtp-Source: AGHT+IHcsjaWEnKL8jxU0081CxOdzGekWja9aope3tEf7+hT3C2MboCd4CzmMZPTWsvZOfodDqf3Gg==
X-Received: by 2002:adf:f804:0:b0:374:c1d6:f57f with SMTP id ffacd0b85a97d-37d0e6f5fabmr5104930f8f.7.1728282368192;
        Sun, 06 Oct 2024 23:26:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690fc53sm4967086f8f.4.2024.10.06.23.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 23:26:07 -0700 (PDT)
Date: Mon, 7 Oct 2024 09:26:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	kernel-janitors@vger.kernel.org
Subject: [bug report] octeontx2-af: Drop rules for NPC MCAM
Message-ID: <6c9b5d25-db1f-43e1-8ebf-7be45e63bdb8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Ratheesh Kannoth,

Commit 3571fe07a090 ("octeontx2-af: Drop rules for NPC MCAM") from
Jul 8, 2022 (linux-next), leads to the following Smatch static
checker warning:

	drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c:1973 rvu_npc_exact_init()
	warn: potential ! vs ~ typo

drivers/net/ethernet/marvell/octeontx2/af/rvu_npc_hash.c
    1860 int rvu_npc_exact_init(struct rvu *rvu)
    1861 {
    1862         u64 bcast_mcast_val, bcast_mcast_mask;
    1863         struct npc_exact_table *table;
    1864         u64 exact_val, exact_mask;
    1865         u64 chan_val, chan_mask;
    1866         u8 cgx_id, lmac_id;
    1867         u32 *drop_mcam_idx;
    1868         u16 max_lmac_cnt;
    1869         u64 npc_const3;
    1870         int table_size;
    1871         int blkaddr;
    1872         u16 pcifunc;
    1873         int err, i;
    1874         u64 cfg;
    1875         bool rc;
    1876 
    1877         /* Read NPC_AF_CONST3 and check for have exact
    1878          * match functionality is present
    1879          */
    1880         blkaddr = rvu_get_blkaddr(rvu, BLKTYPE_NPC, 0);
    1881         if (blkaddr < 0) {
    1882                 dev_err(rvu->dev, "%s: NPC block not implemented\n", __func__);
    1883                 return -EINVAL;
    1884         }
    1885 
    1886         /* Check exact match feature is supported */
    1887         npc_const3 = rvu_read64(rvu, blkaddr, NPC_AF_CONST3);
    1888         if (!(npc_const3 & BIT_ULL(62)))
    1889                 return 0;
    1890 
    1891         /* Check if kex profile has enabled EXACT match nibble */
    1892         cfg = rvu_read64(rvu, blkaddr, NPC_AF_INTFX_KEX_CFG(NIX_INTF_RX));
    1893         if (!(cfg & NPC_EXACT_NIBBLE_HIT))
    1894                 return 0;
    1895 
    1896         /* Set capability to true */
    1897         rvu->hw->cap.npc_exact_match_enabled = true;
    1898 
    1899         table = kzalloc(sizeof(*table), GFP_KERNEL);
    1900         if (!table)
    1901                 return -ENOMEM;
    1902 
    1903         dev_dbg(rvu->dev, "%s: Memory allocation for table success\n", __func__);
    1904         rvu->hw->table = table;
    1905 
    1906         /* Read table size, ways and depth */
    1907         table->mem_table.ways = FIELD_GET(GENMASK_ULL(19, 16), npc_const3);
    1908         table->mem_table.depth = FIELD_GET(GENMASK_ULL(15, 0), npc_const3);
    1909         table->cam_table.depth = FIELD_GET(GENMASK_ULL(31, 24), npc_const3);
    1910 
    1911         dev_dbg(rvu->dev, "%s: NPC exact match 4way_2k table(ways=%d, depth=%d)\n",
    1912                 __func__,  table->mem_table.ways, table->cam_table.depth);
    1913 
    1914         /* Check if depth of table is not a sequre of 2
    1915          * TODO: why _builtin_popcount() is not working ?
    1916          */
    1917         if ((table->mem_table.depth & (table->mem_table.depth - 1)) != 0) {
    1918                 dev_err(rvu->dev,
    1919                         "%s: NPC exact match 4way_2k table depth(%d) is not square of 2\n",
    1920                         __func__,  table->mem_table.depth);
    1921                 return -EINVAL;
    1922         }
    1923 
    1924         table_size = table->mem_table.depth * table->mem_table.ways;
    1925 
    1926         /* Allocate bitmap for 4way 2K table */
    1927         table->mem_table.bmap = devm_bitmap_zalloc(rvu->dev, table_size,
    1928                                                    GFP_KERNEL);
    1929         if (!table->mem_table.bmap)
    1930                 return -ENOMEM;
    1931 
    1932         dev_dbg(rvu->dev, "%s: Allocated bitmap for 4way 2K entry table\n", __func__);
    1933 
    1934         /* Allocate bitmap for 32 entry mcam */
    1935         table->cam_table.bmap = devm_bitmap_zalloc(rvu->dev, 32, GFP_KERNEL);
    1936 
    1937         if (!table->cam_table.bmap)
    1938                 return -ENOMEM;
    1939 
    1940         dev_dbg(rvu->dev, "%s: Allocated bitmap for 32 entry cam\n", __func__);
    1941 
    1942         table->tot_ids = table_size + table->cam_table.depth;
    1943         table->id_bmap = devm_bitmap_zalloc(rvu->dev, table->tot_ids,
    1944                                             GFP_KERNEL);
    1945 
    1946         if (!table->id_bmap)
    1947                 return -ENOMEM;
    1948 
    1949         dev_dbg(rvu->dev, "%s: Allocated bitmap for id map (total=%d)\n",
    1950                 __func__, table->tot_ids);
    1951 
    1952         /* Initialize list heads for npc_exact_table entries.
    1953          * This entry is used by debugfs to show entries in
    1954          * exact match table.
    1955          */
    1956         for (i = 0; i < NPC_EXACT_TBL_MAX_WAYS; i++)
    1957                 INIT_LIST_HEAD(&table->lhead_mem_tbl_entry[i]);
    1958 
    1959         INIT_LIST_HEAD(&table->lhead_cam_tbl_entry);
    1960         INIT_LIST_HEAD(&table->lhead_gbl);
    1961 
    1962         mutex_init(&table->lock);
    1963 
    1964         rvu_exact_config_secret_key(rvu);
    1965         rvu_exact_config_search_key(rvu);
    1966 
    1967         rvu_exact_config_table_mask(rvu);
    1968         rvu_exact_config_result_ctrl(rvu, table->mem_table.depth);
    1969 
    1970         /* - No drop rule for LBK
    1971          * - Drop rules for SDP and each LMAC.
    1972          */
--> 1973         exact_val = !NPC_EXACT_RESULT_HIT;

Should this have been "exact_val = ~NPC_EXACT_RESULT_HIT;"?

    1974         exact_mask = NPC_EXACT_RESULT_HIT;
    1975 
    1976         /* nibble - 3        2  1   0
    1977          *           L3B L3M L2B L2M
    1978          */
    1979         bcast_mcast_val = 0b0000;
    1980         bcast_mcast_mask = 0b0011;
    1981 
    1982         /* Install SDP drop rule */
    1983         drop_mcam_idx = &table->num_drop_rules;
    1984 
    1985         max_lmac_cnt = rvu->cgx_cnt_max * rvu->hw->lmac_per_cgx +
    1986                        PF_CGXMAP_BASE;
    1987 
    1988         for (i = PF_CGXMAP_BASE; i < max_lmac_cnt; i++) {
    1989                 if (rvu->pf2cgxlmac_map[i] == 0xFF)
    1990                         continue;
    1991 
    1992                 rvu_get_cgx_lmac_id(rvu->pf2cgxlmac_map[i], &cgx_id, &lmac_id);
    1993 
    1994                 rc = rvu_npc_exact_calc_drop_rule_chan_and_mask(rvu, NIX_INTF_TYPE_CGX, cgx_id,
    1995                                                                 lmac_id, &chan_val, &chan_mask);
    1996                 if (!rc) {
    1997                         dev_err(rvu->dev,
    1998                                 "%s: failed, info chan_val=0x%llx chan_mask=0x%llx rule_id=%d\n",
    1999                                 __func__, chan_val, chan_mask, *drop_mcam_idx);
    2000                         return -EINVAL;
    2001                 }
    2002 
    2003                 /* Filter rules are only for PF */
    2004                 pcifunc = RVU_PFFUNC(i, 0);
    2005 
    2006                 dev_dbg(rvu->dev,
    2007                         "%s:Drop rule cgx=%d lmac=%d chan(val=0x%llx, mask=0x%llx\n",
    2008                         __func__, cgx_id, lmac_id, chan_val, chan_mask);
    2009 
    2010                 rc = rvu_npc_exact_save_drop_rule_chan_and_mask(rvu, table->num_drop_rules,
    2011                                                                 chan_val, chan_mask, pcifunc);
    2012                 if (!rc) {
    2013                         dev_err(rvu->dev,
    2014                                 "%s: failed to set drop info for cgx=%d, lmac=%d, chan=%llx\n",
    2015                                 __func__, cgx_id, lmac_id, chan_val);
    2016                         return -EINVAL;
    2017                 }
    2018 
    2019                 err = npc_install_mcam_drop_rule(rvu, *drop_mcam_idx,
    2020                                                  &table->counter_idx[*drop_mcam_idx],
    2021                                                  chan_val, chan_mask,
    2022                                                  exact_val, exact_mask,
    2023                                                  bcast_mcast_val, bcast_mcast_mask);
    2024                 if (err) {
    2025                         dev_err(rvu->dev,
    2026                                 "failed to configure drop rule (cgx=%d lmac=%d)\n",
    2027                                 cgx_id, lmac_id);
    2028                         return err;
    2029                 }
    2030 
    2031                 (*drop_mcam_idx)++;
    2032         }
    2033 
    2034         dev_info(rvu->dev, "initialized exact match table successfully\n");
    2035         return 0;
    2036 }

regards,
dan carpenter
