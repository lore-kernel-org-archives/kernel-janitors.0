Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7363CC77B78
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Apr 2023 10:45:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbjDUKpN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 06:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbjDUKo7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 06:44:59 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418C38A52
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:44:58 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f09b9ac51dso44905065e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682073897; x=1684665897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BmqSgoVn+4GYHbRCGkxih6mgI9KXrJS4qZaVx99YBF0=;
        b=FTOGGLy/4aVVYGpSAWcxoSFoKy7NS1c2I4lPWKmOr+cOGefYqCAripq+GvJz0clFvc
         gdD/ZSwGjGsoiQa4M4qnk4eQ6o+oJj+yYItNqCY3FXuDVQcVzGHOUAXMXKkth89GctPQ
         DNmYACDMfspf2v+ljSPoWQG+S4BUzXpw/z9RMmNBYw9+D8EQe60F+m2RdU48JhipyJNu
         KjiD9hDj7MJAGsfXrIzxlFM2N0D1u4HnNshGC49W64Bm8/R98GFr/4fg1D9TDZF4IDgx
         1WgS3afclE8xJWSc+iqu9sJq29VdfKLAvTVcvAgnriEM/lX+qshDkUWZuf5f1rfzKAKC
         FyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682073897; x=1684665897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BmqSgoVn+4GYHbRCGkxih6mgI9KXrJS4qZaVx99YBF0=;
        b=Q1DgAm9T87DaDYkHMKMKaiJvwkrBWyKSkNGxv2yaUIPBG7l1ERhskVGMgs3FIyGlZJ
         xepFd6bVWSooz6cA6ILYKBwpdbhLEvqBmS39p1A9x7mrzhOGUC4cETWgj/mdunz9lHvV
         hEKpoMdI+5TGnxDeTNBFpUrUwlukLqbV+0b3CqVxklfSJRp1xQVEAwigWWNpV4jLbKxy
         ttFLGUTsmXdevBWRqkBmcgA75d6PMn94wAsE0DZeaMcCb3IrnIyYsN3Ulmqu5pJM0LQB
         Bd9mCkpKYe3sp1ZmKhOc7ZL1hl1td9G4lhFQQU7YSGJykoIk8Lb1NaJIAt9/fllbmEX0
         CTaw==
X-Gm-Message-State: AAQBX9e87IWmLrjVadV+oHLkeD/k5AMV+QX5vPXtlADIY1jWe7YUZVeM
        AVY2kQM9PpeJZQQ1/dwM4oTKSQ==
X-Google-Smtp-Source: AKy350ZaT1G0S2zY1VUe0Yq2m3hK6Ma2A+K1oVpKfU0a6Bwjve9Lz1EVu8IMAzOCGQdABY03xmatBQ==
X-Received: by 2002:a5d:6a11:0:b0:2f6:661:c03c with SMTP id m17-20020a5d6a11000000b002f60661c03cmr4068864wru.28.1682073896851;
        Fri, 21 Apr 2023 03:44:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p17-20020a056000019100b002fda1b12a0bsm4192642wrx.2.2023.04.21.03.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 03:44:56 -0700 (PDT)
Date:   Fri, 21 Apr 2023 13:44:54 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Abhyuday Godhasara <abhyuday.godhasara@xilinx.com>
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Patel <tejas.patel@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] driver: soc: xilinx: use _safe loop iterator to avoid a use
 after free
Message-ID: <761e0e4a-4caf-4a71-8f47-1c6ad908a848@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The hash_for_each_possible() loop dereferences "eve_data" to get the
next item on the list.  However the loop frees eve_data so it leads to
a use after free.  Use hash_for_each_possible_safe() instead.

Fixes: c7fdb2404f66 ("drivers: soc: xilinx: add xilinx event management driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Found by static analysis and not tested.

 drivers/soc/xilinx/xlnx_event_manager.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index c76381899ef4..f9d9b82b562d 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -192,11 +192,12 @@ static int xlnx_remove_cb_for_suspend(event_cb_func_t cb_fun)
 	struct registered_event_data *eve_data;
 	struct agent_cb *cb_pos;
 	struct agent_cb *cb_next;
+	struct hlist_node *tmp;
 
 	is_need_to_unregister = false;
 
 	/* Check for existing entry in hash table for given cb_type */
-	hash_for_each_possible(reg_driver_map, eve_data, hentry, PM_INIT_SUSPEND_CB) {
+	hash_for_each_possible_safe(reg_driver_map, eve_data, tmp, hentry, PM_INIT_SUSPEND_CB) {
 		if (eve_data->cb_type == PM_INIT_SUSPEND_CB) {
 			/* Delete the list of callback */
 			list_for_each_entry_safe(cb_pos, cb_next, &eve_data->cb_list_head, list) {
@@ -228,11 +229,12 @@ static int xlnx_remove_cb_for_notify_event(const u32 node_id, const u32 event,
 	u64 key = ((u64)node_id << 32U) | (u64)event;
 	struct agent_cb *cb_pos;
 	struct agent_cb *cb_next;
+	struct hlist_node *tmp;
 
 	is_need_to_unregister = false;
 
 	/* Check for existing entry in hash table for given key id */
-	hash_for_each_possible(reg_driver_map, eve_data, hentry, key) {
+	hash_for_each_possible_safe(reg_driver_map, eve_data, tmp, hentry, key) {
 		if (eve_data->key == key) {
 			/* Delete the list of callback */
 			list_for_each_entry_safe(cb_pos, cb_next, &eve_data->cb_list_head, list) {
-- 
2.39.2

