Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFF5EE4993
	for <kernel-janitors@archiver.kernel.org>; Sun, 20 Aug 2023 09:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjHTJvn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 20 Aug 2023 05:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjHTJvk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 20 Aug 2023 05:51:40 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52A64EC3
        for <kernel-janitors@vger.kernel.org>; Sun, 20 Aug 2023 02:51:29 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id Xf5hqwKJwP8tnXf5iq04g0; Sun, 20 Aug 2023 11:51:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1692525087;
        bh=Mh61Dvqgft6jmx3lrPrBaNnQEkuCgovy2orBj5LwvkM=;
        h=From:To:Cc:Subject:Date;
        b=P66eIAB0ilchO3DxiGNwVbTmhNv/U6gsfPkzH9QXC3zpFhFiqJlCIeA2dACx9CTzS
         pi3tnzo/2pz2MaKGt0p0iOAXeuU62m/eL8HyaDsqyxj8KtWSqE6uodGkbrE2tTdsZb
         1V/gkLCuVTQStoff3xpdxZZ3nLK4j5mE7JZrLDVP/yYLzLGWWOW0kdxjWqjhnA2W+4
         yfiwiTnPTRSzI2tlirYSSxMSH6pXgGrhkhzZjpKVrdN4cGXVnJsqGXYf6wQY1Tuh3s
         QC5mSwfHYVj+/Vyfr30UDwPNZU9IV7Hm6Uzz90Rfq0nrhcmpNzhaA6s99jQo1Kt3xB
         XCjra/tiLPySQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 20 Aug 2023 11:51:27 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
        Felix.Kuehling@amd.com, Arunpravin.PaneerSelvam@amd.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 0/4] drm/amdgpu: Explicitly add a flexible array at the end of 'struct amdgpu_bo_list' and simplify amdgpu_bo_list_create()
Date:   Sun, 20 Aug 2023 11:51:12 +0200
Message-Id: <cover.1692524665.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This serie simplifies amdgpu_bo_list_create() and usage of the 'struct
amdgpu_bo_list'.

It is compile tested only.

Christophe JAILLET (4):
  drm/amdgpu: Explicitly add a flexible array at the end of 'struct
    amdgpu_bo_list'
  drm/amdgpu: Remove a redundant sanity check
  drm/amdgpu: Remove amdgpu_bo_list_array_entry()
  drm/amdgpu: Use kvzalloc() to simplify code

 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 15 ++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 18 ++++++------------
 2 files changed, 8 insertions(+), 25 deletions(-)

-- 
2.34.1

