Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19034C6FA82
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Sep 2022 11:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbiI0LQw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Sep 2022 07:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbiI0LQc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Sep 2022 07:16:32 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B386D54E
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Sep 2022 04:15:58 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id n83so11451114oif.11
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Sep 2022 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=R6DEIK2Zq+FTX+wZyA6Mcr+7aOgLXcB6/3yVSe028aA=;
        b=RysijwsUAJ4+AIMPMC72NnJNhU1LRFV/xN+4XEjPHCtNvNhAooO3QNXxGIrHD3zvZj
         qFWMnbTbREVx92DLjafJmkzXtbVClWEB9KvKD62HrSIEEDCdZItaQRTrp31bxXLGlVJ4
         K/EOtnC0RNgEQGyBZqMf/UXWUj+WYsrm8Iv2KJ0Pg+cwVMwfoFk7uBsGWfpwX3XcmHLh
         V+lLHddpoD9SXn4OAUPgVPBo33FrI/SsGfCuE/XHojDfvoc5ganpSwavjgzxv5laz3No
         quq2QtFZv+S1jnGgwpvsMoWYaCzb3wF5uQt/CLtqYXP5zEnrU3vRkSrjJgmZo9Tn8kZC
         RQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=R6DEIK2Zq+FTX+wZyA6Mcr+7aOgLXcB6/3yVSe028aA=;
        b=QJ+EIHwxM83BOiMWZ2/8Y6XIHv5nTYN7Ym5qxZFUDuLOTXqE63JP80TDT7rsqw5C8K
         xmIdRkC1RrJPezx/QMaVw8fbCvN7Vtn/vopuVPgjG9IyPEuUsFusc/HxbHa0e98uG5nH
         Zq3dd8VoRaFBzRPQnPbGi6+DkPz2AeQOv/JxfI/KQlRpXOYu6CFHngzLUjq8csLziLOK
         2LRPXxol9fhidfTMz9Rqm+9oVdw3xzGJ0WNrGJa2Js1qV+JSpPziTr44kyILdyMkz0Ab
         LtS6D6+sFpN3jh2/oHwh2/HS1VX88uUjc4SJa6rpgxkXwNj/1amKeDEvSQh0bPdIMc7E
         qMqg==
X-Gm-Message-State: ACrzQf1kwZ+JD1GOYgFcg/qTXO4Dt7Cp3wiAGmT9IyrCgQvFgJKRfovk
        0HBy3a6C7RykH7fN80tL0suPDTqGGoowWAJrxD/tXA==
X-Google-Smtp-Source: AMsMyM6ZFNdptDkcaJzdd4BuwwP5UqO4ID3fTeODCcJ8PdTnxhwQseJ8nJrPrng+q6GITOhMhHDgXb0m3aGt0rQYaxI=
X-Received: by 2002:a05:6808:148d:b0:350:7858:63ce with SMTP id
 e13-20020a056808148d00b00350785863cemr1518431oiw.106.1664277357708; Tue, 27
 Sep 2022 04:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <88410cddd31197ea26840d7dd71612bece8c6acf.1663871981.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <88410cddd31197ea26840d7dd71612bece8c6acf.1663871981.git.christophe.jaillet@wanadoo.fr>
From:   Jamal Hadi Salim <jhs@mojatatu.com>
Date:   Tue, 27 Sep 2022 07:15:46 -0400
Message-ID: <CAM0EoM=EsyAYfQreLvUhyr1csuR2SQx1hLFzVX86OhHhLdU5WA@mail.gmail.com>
Subject: Re: [PATCH v2] headers: Remove some left-over license text
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     yhs@fb.com, Cong Wang <xiyou.wangcong@gmail.com>,
        Jiri Pirko <jiri@resnulli.us>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Acked-by: Jamal Hadi Salim <jhs@mojatatu.com>

cheers,
jamal

On Thu, Sep 22, 2022 at 2:41 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Remove some left-over from commit e2be04c7f995 ("License cleanup: add SPDX
> license identifier to uapi header files with a license")
>
> When the SPDX-License-Identifier tag has been added, the corresponding
> license text has not been removed.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Changes since v1:
>   - add tools/include/uapi/linux/tc_act/tc_bpf.h   [Yonghong Song <yhs@fb.com>]
>
> v1: https://lore.kernel.org/all/2a15aba72497e78ff08c8b8a8bfe3cf5a3e6ee18.1662897019.git.christophe.jaillet@wanadoo.fr/
> ---
>  include/uapi/linux/tc_act/tc_bpf.h        |  5 -----
>  include/uapi/linux/tc_act/tc_skbedit.h    | 13 -------------
>  include/uapi/linux/tc_act/tc_skbmod.h     |  7 +------
>  include/uapi/linux/tc_act/tc_tunnel_key.h |  5 -----
>  include/uapi/linux/tc_act/tc_vlan.h       |  5 -----
>  tools/include/uapi/linux/tc_act/tc_bpf.h  |  5 -----
>  6 files changed, 1 insertion(+), 39 deletions(-)
>
> diff --git a/include/uapi/linux/tc_act/tc_bpf.h b/include/uapi/linux/tc_act/tc_bpf.h
> index 653c4f94f76e..fe6c8f8f3e8c 100644
> --- a/include/uapi/linux/tc_act/tc_bpf.h
> +++ b/include/uapi/linux/tc_act/tc_bpf.h
> @@ -1,11 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>  /*
>   * Copyright (c) 2015 Jiri Pirko <jiri@resnulli.us>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
>   */
>
>  #ifndef __LINUX_TC_BPF_H
> diff --git a/include/uapi/linux/tc_act/tc_skbedit.h b/include/uapi/linux/tc_act/tc_skbedit.h
> index 6cb6101208d0..64032513cc4c 100644
> --- a/include/uapi/linux/tc_act/tc_skbedit.h
> +++ b/include/uapi/linux/tc_act/tc_skbedit.h
> @@ -2,19 +2,6 @@
>  /*
>   * Copyright (c) 2008, Intel Corporation.
>   *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program; if not, write to the Free Software Foundation, Inc., 59 Temple
> - * Place - Suite 330, Boston, MA 02111-1307 USA.
> - *
>   * Author: Alexander Duyck <alexander.h.duyck@intel.com>
>   */
>
> diff --git a/include/uapi/linux/tc_act/tc_skbmod.h b/include/uapi/linux/tc_act/tc_skbmod.h
> index af6ef2cfbf3d..ac62c9a993ea 100644
> --- a/include/uapi/linux/tc_act/tc_skbmod.h
> +++ b/include/uapi/linux/tc_act/tc_skbmod.h
> @@ -1,12 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>  /*
>   * Copyright (c) 2016, Jamal Hadi Salim
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> -*/
> + */
>
>  #ifndef __LINUX_TC_SKBMOD_H
>  #define __LINUX_TC_SKBMOD_H
> diff --git a/include/uapi/linux/tc_act/tc_tunnel_key.h b/include/uapi/linux/tc_act/tc_tunnel_key.h
> index 3f10dc4e7a4b..49ad4033951b 100644
> --- a/include/uapi/linux/tc_act/tc_tunnel_key.h
> +++ b/include/uapi/linux/tc_act/tc_tunnel_key.h
> @@ -2,11 +2,6 @@
>  /*
>   * Copyright (c) 2016, Amir Vadai <amir@vadai.me>
>   * Copyright (c) 2016, Mellanox Technologies. All rights reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
>   */
>
>  #ifndef __LINUX_TC_TUNNEL_KEY_H
> diff --git a/include/uapi/linux/tc_act/tc_vlan.h b/include/uapi/linux/tc_act/tc_vlan.h
> index 5b306fe815cc..3e1f8e57cdd2 100644
> --- a/include/uapi/linux/tc_act/tc_vlan.h
> +++ b/include/uapi/linux/tc_act/tc_vlan.h
> @@ -1,11 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>  /*
>   * Copyright (c) 2014 Jiri Pirko <jiri@resnulli.us>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
>   */
>
>  #ifndef __LINUX_TC_VLAN_H
> diff --git a/tools/include/uapi/linux/tc_act/tc_bpf.h b/tools/include/uapi/linux/tc_act/tc_bpf.h
> index 653c4f94f76e..fe6c8f8f3e8c 100644
> --- a/tools/include/uapi/linux/tc_act/tc_bpf.h
> +++ b/tools/include/uapi/linux/tc_act/tc_bpf.h
> @@ -1,11 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
>  /*
>   * Copyright (c) 2015 Jiri Pirko <jiri@resnulli.us>
> - *
> - * This program is free software; you can redistribute it and/or modify
> - * it under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
>   */
>
>  #ifndef __LINUX_TC_BPF_H
> --
> 2.34.1
>
