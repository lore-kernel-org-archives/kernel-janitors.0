Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A59C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 May 2022 15:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238985AbiERPHi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 May 2022 11:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239153AbiERPHg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 May 2022 11:07:36 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E173A17705A
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 08:07:35 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id u3so3143146wrg.3
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FPSPOqe/pxSUmwxqWFe4+MjWy0h9hLSH/JKHQNi0S+g=;
        b=e0cyN4uhfVD4zxKWjKodVuxdLsyIfwyOTdXbXXlOjAbkkvSvWfUy/asON2Vz0xUTY6
         p5NeUorVEDJktXzRb2U5uL3xiOPnE89m3ckhhTSYaL+ZYM6fjbmTCp3G/LLjveee+PoJ
         i7TsU1zgWpVQb1JSmAn/0axIgs/SQIzi+5Rn8iTFM6hIniOEn8PgtrfhCgC5+qCHX2kJ
         ENJRPPeHTWfvCxRI4N//OdF3PesqpBZb9OoUuOMAeIF5jJw6i87cdifo5BGRZ9hPxWC+
         nszjz5epWSsUxDDQ4IlsBCr+CTFJnGWjMrVKySrEW9G2ejBwb5FXBmtvwl0t35b0AqAe
         uhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FPSPOqe/pxSUmwxqWFe4+MjWy0h9hLSH/JKHQNi0S+g=;
        b=cmoZDOuoW1hQOkr/snksgc9QDSPKb2A7tDGu9fjeLC+pCe2oufghaVr3sPwisNXPnC
         tl9yKjpsx3PjpmWm4Ahha2K+SXG35ZthhoTlj6yMYw6QTwpAzJILmljyIU/Nco2rJPPz
         CzyzkWXq86FXnuT2bpjogG7XVaOpF9YcN0/8jRKSufbYLWJ5eLQTRhX7UcEVF0XL6D6U
         DqQZi/e6ns4bIewpwTkZQza6VyCBfMHWIt1ZgEdGTeZ5cC6BKwNXTWiYbqaJw4SRMj15
         EbvPNdyYIFDT+dQJJbFf48wd+ZBQ3Sluk60EsVIso4N8zsCTCU/ef8xOLbRA+fOeIgmY
         81PQ==
X-Gm-Message-State: AOAM532OWmeUVOzVUFRKowjWGDS7p1D9hkGbBEBGV2tJN0KV8fYvliHD
        ITQHeKWRUGoUM0JHm8fE084=
X-Google-Smtp-Source: ABdhPJzrNMUeKwa6teu0r0qTTi6HCC1jxo9F9VlKgh+/ZBt65pF5T6SzUBKrnMUqbEEfSLOcqMLsSQ==
X-Received: by 2002:a5d:64c1:0:b0:20c:6ff9:3a61 with SMTP id f1-20020a5d64c1000000b0020c6ff93a61mr94063wri.709.1652886454367;
        Wed, 18 May 2022 08:07:34 -0700 (PDT)
Received: from gmail.com ([81.168.73.77])
        by smtp.gmail.com with ESMTPSA id d25-20020adf9b99000000b0020d03b5c33dsm2473102wrc.46.2022.05.18.08.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 08:07:33 -0700 (PDT)
Date:   Wed, 18 May 2022 16:07:32 +0100
From:   Martin Habets <habetsm.xilinx@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] sfc/siena: Remove build references to missing
 functionality
Message-ID: <20220518150732.GA18437@gmail.com>
References: <YoH5tJMnwuGTrn1Z@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoH5tJMnwuGTrn1Z@kili>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

The analysis is correct. I'll post a patch for this.

Thanks!
Martin

On Mon, May 16, 2022 at 10:13:56AM +0300, Dan Carpenter wrote:
> Hello Martin Habets,
> 
> The patch 956f2d86cb37: "sfc/siena: Remove build references to
> missing functionality" from May 9, 2022, leads to the following
> Smatch static checker warning:
> 
> 	drivers/net/ethernet/sfc/siena/tx.c:184 __efx_siena_enqueue_skb()
> 	warn: duplicate check 'segments' (previous on line 158)
> 
> drivers/net/ethernet/sfc/siena/tx.c
>     139 netdev_tx_t __efx_siena_enqueue_skb(struct efx_tx_queue *tx_queue,
>     140                                     struct sk_buff *skb)
>     141 {
>     142         unsigned int old_insert_count = tx_queue->insert_count;
>     143         bool xmit_more = netdev_xmit_more();
>     144         bool data_mapped = false;
>     145         unsigned int segments;
>     146         unsigned int skb_len;
>     147         int rc;
>     148 
>     149         skb_len = skb->len;
>     150         segments = skb_is_gso(skb) ? skb_shinfo(skb)->gso_segs : 0;
>     151         if (segments == 1)
>     152                 segments = 0; /* Don't use TSO for a single segment. */
>     153 
>     154         /* Handle TSO first - it's *possible* (although unlikely) that we might
>     155          * be passed a packet to segment that's smaller than the copybreak/PIO
>     156          * size limit.
>     157          */
>     158         if (segments) {
>     159                 rc = efx_siena_tx_tso_fallback(tx_queue, skb);
>     160                 tx_queue->tso_fallbacks++;
>     161                 if (rc == 0)
>     162                         return 0;
>     163                 goto err;
> 
> If segments is non-zero then we hit this goto.
> 
>     164         } else if (skb->data_len && skb_len <= EFX_TX_CB_SIZE) {
>     165                 /* Pad short packets or coalesce short fragmented packets. */
>     166                 if (efx_enqueue_skb_copy(tx_queue, skb))
>     167                         goto err;
>     168                 tx_queue->cb_packets++;
>     169                 data_mapped = true;
>     170         }
>     171 
>     172         /* Map for DMA and create descriptors if we haven't done so already. */
>     173         if (!data_mapped && (efx_siena_tx_map_data(tx_queue, skb, segments)))
>     174                 goto err;
>     175 
>     176         efx_tx_maybe_stop_queue(tx_queue);
>     177 
>     178         tx_queue->xmit_pending = true;
>     179 
>     180         /* Pass off to hardware */
>     181         if (__netdev_tx_sent_queue(tx_queue->core_txq, skb_len, xmit_more))
>     182                 efx_tx_send_pending(tx_queue->channel);
>     183 
> --> 184         if (segments) {
> 
> So this if statement can be deleted.
> 
>     185                 tx_queue->tso_bursts++;
>     186                 tx_queue->tso_packets += segments;
>     187                 tx_queue->tx_packets  += segments;
>     188         } else {
>     189                 tx_queue->tx_packets++;
>     190         }
>     191 
>     192         return NETDEV_TX_OK;
>     193 
>     194 
>     195 err:
>     196         efx_siena_enqueue_unwind(tx_queue, old_insert_count);
>     197         dev_kfree_skb_any(skb);
>     198 
>     199         /* If we're not expecting another transmit and we had something to push
>     200          * on this queue or a partner queue then we need to push here to get the
>     201          * previous packets out.
>     202          */
>     203         if (!xmit_more)
>     204                 efx_tx_send_pending(tx_queue->channel);
>     205 
>     206         return NETDEV_TX_OK;
>     207 }
> 
> regards,
> dan carpenter
