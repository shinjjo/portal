from django.contrib import admin
from .models import Member
# Register your models here.
class MemberAdmin(admin.ModelAdmin):
	list_display=('member_id', 'member_lastname','member_firstname', 'member_type', 'member_email', )
admin.site.register(Member, MemberAdmin)