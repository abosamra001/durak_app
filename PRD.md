# Dorak App (queueing management system)

1\. Problem Statement

الحلاق بيدير زباينه عن طريق كشكول ورقي، العملية بتتطلب خطوات متعددة: البحث عن الاسم، يرن يدوياً، تتبع الترتيب. التكنولوجيا موجودة عشان تبسط العملية دي.

2\. Target User

الحلاق فقط — الزبون مش طرف في الـ app.

3\. Features (MVP)

Queue Management

عرض قائمة زباين النهارده (Home Screen)

عرض زباين أي يوم تاني

إضافة / حذف زبون لأي يوم (اسم + رقم)

تحريك زبون لتراتيب تاني (shift)

Customer Actions

زرار اتصال مباشر بالزبون

زرار SMS يدوي

SMS أوتوماتيك لما فاضل زبون واحد قبله

تخصيص نص الرسالة

زرار "تم الحلاقة" ✓

4\. Out of Scope (MVP)

App has a cloud backup for his data and clients

Login / Auth

SaaS / multi-barber

قائمة زباين محفوظين مسبقاً
اضافة تواريخ حلاقة كل زبون history

Backend / Cloud sync

Payments

5\. Success Metric

+5K downloads على Google Play مع reviews إيجابية.

6\. Technical Constraints

Android only (MVP)

بدون internet — كل الداتا local

SMS بيتبعت من جهاز الحلاق نفسه
