Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53110C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jan 2022 16:23:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238293AbiARQXG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jan 2022 11:23:06 -0500
Received: from mga02.intel.com ([134.134.136.20]:20688 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236470AbiARQXE (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jan 2022 11:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642522983; x=1674058983;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yemg3DPaak21b4QQ6QUWUQzpYoGj++aHEpM6CdFUM4c=;
  b=CeUIKUt2bu/V19rwbdL9ExLiHXhEoiSA7IXpxO+tjvJG3UH7HbkwjarQ
   dB9fk6BFobTdymsiRZJjNdGCCPhhhNGc356R54Bm1TXTwt4ojoWy9r7S6
   tu1WAOUYDcuJIFkwh60HLwaWMVFe0dqEv5TQ1pIMZHlGyvDM+tW/SR/le
   uWRHtux4j64Tt+laYX5r2APRbCRoauj2trsAOIJZ6TtOo/guOMBoSsjmk
   BUAxlQa8hWB9EaLIzDLuvSQsPngJL89uXh+GKbx2joBa1R4n9pn43AwlI
   H8raNBBurMFnQRMIl/M1chQKADtEuH/T45Lzc5cWg7y7ttaCnNMuRVIYi
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="232214254"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="232214254"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 08:23:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="764640419"
Received: from tzanussi-mobl4.amr.corp.intel.com (HELO [10.212.123.117]) ([10.212.123.117])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 08:23:02 -0800
Message-ID: <c842e1a7-ab46-8267-9700-22d0ecb508cb@linux.intel.com>
Date:   Tue, 18 Jan 2022 10:22:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [bug report] tracing: Allow whitespace to surround hist trigger
 filter
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        kernel-janitors@vger.kernel.org
References: <20220118093809.GA13017@kili>
From:   "Zanussi, Tom" <tom.zanussi@linux.intel.com>
In-Reply-To: <20220118093809.GA13017@kili>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 1/18/2022 3:38 AM, Dan Carpenter wrote:
> [ This is an older warning but renaming the function made it appear in
>    the new warnings list.  I have searched my outbox and I don't think
>    I forwarded this one before.  -dan ]
> 
> Hello Tom Zanussi,
> 
> The patch ec5ce0987541: "tracing: Allow whitespace to surround hist
> trigger filter" from Jan 15, 2018, leads to the following Smatch
> static checker warning:
> 
> 	kernel/trace/trace_events_hist.c:6199 event_hist_trigger_parse()
> 	warn: 'p' can't be NULL.
> 
> kernel/trace/trace_events_hist.c
>      6149 static int event_hist_trigger_parse(struct event_command *cmd_ops,
>      6150                                     struct trace_event_file *file,
>      6151                                     char *glob, char *cmd, char *param)
>      6152 {
>      6153         unsigned int hist_trigger_bits = TRACING_MAP_BITS_DEFAULT;
>      6154         struct event_trigger_data *trigger_data;
>      6155         struct hist_trigger_attrs *attrs;
>      6156         struct event_trigger_ops *trigger_ops;
>      6157         struct hist_trigger_data *hist_data;
>      6158         struct synth_event *se;
>      6159         const char *se_name;
>      6160         bool remove = false;
>      6161         char *trigger, *p, *start;
>      6162         int ret = 0;
>      6163
>      6164         lockdep_assert_held(&event_mutex);
>      6165
>      6166         if (glob && strlen(glob)) {
>      6167                 hist_err_clear();
>      6168                 last_cmd_set(file, param);
>      6169         }
>      6170
>      6171         if (!param)
>      6172                 return -EINVAL;
>      6173
>      6174         if (glob[0] == '!')
>      6175                 remove = true;
>      6176
>      6177         /*
>      6178          * separate the trigger from the filter (k:v [if filter])
>      6179          * allowing for whitespace in the trigger
>      6180          */
>      6181         p = trigger = param;
>      6182         do {
>      6183                 p = strstr(p, "if");
>      6184                 if (!p)
>      6185                         break;
>      6186                 if (p == param)
>      6187                         return -EINVAL;
>      6188                 if (*(p - 1) != ' ' && *(p - 1) != '\t') {
>      6189                         p++;
>      6190                         continue;
>                                   ^^^^^^^^^
> 
> These are the continue paths
> 
>      6191                 }
>      6192                 if (p >= param + strlen(param) - (sizeof("if") - 1) - 1)
>      6193                         return -EINVAL;
>      6194                 if (*(p + sizeof("if") - 1) != ' ' && *(p + sizeof("if") - 1) != '\t') {
>      6195                         p++;
>      6196                         continue;
>                                   ^^^^^^^^^
> 
>      6197                 }
>      6198                 break;
> --> 6199         } while (p);
> 
> Should this be } while(*p);?

No, it shouldn't be *p, it should be p, but the check at the top of the loop (if (!p) break) makes it redundant.  I'll submit a patch to change it to while (1) to avoid the warning.

Thanks,

Tom

> 
>      6200
>      6201         if (!p)
>      6202                 param = NULL;
>      6203         else {
>      6204                 *(p - 1) = '\0';
>      6205                 param = strstrip(p);
>      6206                 trigger = strstrip(trigger);
>      6207         }
>      6208
> 
> regards,
> dan carpenter
