Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DE1C11F66
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 12:52:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E9AF61DE3
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 12:52:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbhF2My5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Jun 2021 08:54:57 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65484 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233981AbhF2Mya (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Jun 2021 08:54:30 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TCmSuQ030460;
        Tue, 29 Jun 2021 12:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=tQ1gwwxeSZKT+SJGmW3u5hRpqS1iSpvljkN4vDLBepc=;
 b=ARgWw/NKkid3sgucrFBifUhe0XQDrW0jV6bONNsPj2xuW+JAN7DNG7VzCfttQN32R4pK
 mhWg8TeEguH6/dsvi3E90IhVaEwUdalE2aWSEECEbl0zBYmsiGS1jC2mOueCIJynOjCk
 Pyksf2h8JozQSOqPpMJHzwynDI9TbX0ZjerdkOOU79yW55XIGuRKCU0vjH0RUJjxU2xm
 4ZueX/F8kqvDXEMXjHSRbttdoYEwn8ZPwA5gN2DzyENDNWJlPdRbjONr1dDMg+hePqyS
 z/p9frEZfqMyPSeMeQJEVourKseW0rMexChodM7TBAp9UuHnMsa95nfDsRJgzuQW5ckP hA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 39f6pqbhgg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 12:52:01 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15TCjsw6035756;
        Tue, 29 Jun 2021 12:51:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by userp3030.oracle.com with ESMTP id 39dsbxs96c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 12:51:59 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15TCoBpo047943;
        Tue, 29 Jun 2021 12:51:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 39dsbxs95s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 29 Jun 2021 12:51:59 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15TCpwYo026156;
        Tue, 29 Jun 2021 12:51:58 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 29 Jun 2021 12:51:57 +0000
Date:   Tue, 29 Jun 2021 15:51:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     bristot@redhat.com
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] trace: Add timerlat tracer
Message-ID: <YNsXaDP7gUohbhLS@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-GUID: huXAl_WP2g32oYv1jvnyAXejlAEXcld-
X-Proofpoint-ORIG-GUID: huXAl_WP2g32oYv1jvnyAXejlAEXcld-
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Daniel Bristot de Oliveira,

The patch a955d7eac177: "trace: Add timerlat tracer" from Jun 22,
2021, leads to the following static checker warning:

	kernel/trace/trace_osnoise.c:1400 timerlat_main()
	warn: inconsistent indenting

kernel/trace/trace_osnoise.c
  1385          wait_next_period(tlat);
  1386  
  1387          osn_var->sampling = 1;
  1388  
  1389          while (!kthread_should_stop()) {
  1390                  now = ktime_to_ns(hrtimer_cb_get_time(&tlat->timer));
  1391                  diff = now - tlat->abs_period;
  1392  
  1393                  s.seqnum = tlat->count;
  1394                  s.timer_latency = diff;
  1395                  s.context = THREAD_CONTEXT;
  1396  
  1397                  trace_timerlat_sample(&s);
  1398  
  1399  #ifdef CONFIG_STACKTRACE
  1400          if (osnoise_data.print_stack)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This should be indented another tab?

  1401                  if (osnoise_data.print_stack <= time_to_us(diff))
  1402                          timerlat_dump_stack();
  1403  #endif /* CONFIG_STACKTRACE */
  1404  
  1405                  tlat->tracing_thread = false;
  1406                  if (osnoise_data.stop_tracing_total)
  1407                          if (time_to_us(diff) >= osnoise_data.stop_tracing_total)
  1408                                  osnoise_stop_tracing();
  1409  
  1410                  wait_next_period(tlat);
  1411          }
  1412  
  1413          hrtimer_cancel(&tlat->timer);
  1414          return 0;
  1415  }

regards,
dan carpenter
